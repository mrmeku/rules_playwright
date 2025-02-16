use crate::download_paths::PlatformBase;
use askama::Template;
use std::{collections::HashMap, fs, io, path::Path};

use super::RootTarget;

#[derive(Template)]
#[template(
    source = r#"
package(default_visibility = ["//visibility:public"])
{% for target in alias_targets %}
alias(
    name = "{{ target.label }}",
    actual = select(
        {
            {%- for entry in target.src_select %}
            "{{ entry.key }}": "{{ entry.value }}",
            {%- endfor %}
        },
    ),
)
{% endfor %}
"#,
    ext = "txt"
)]
struct AliasBuildFileTemplate {
    alias_targets: Vec<AliasTarget>,
}

struct AliasTarget {
    label: String,
    src_select: Vec<AliasTargetSelect>,
}

struct AliasTargetSelect {
    key: String,
    value: String,
}

pub fn write_build_file(
    out_dir: &Path,
    root_targets: &HashMap<String, RootTarget>,
) -> io::Result<()> {
    let template = AliasBuildFileTemplate {
        alias_targets: root_targets
            .iter()
            .flat_map(|(_, root_target)| {
                root_target
                    .src_select
                    .values()
                    .map(|platform_group_target| AliasTarget {
                        label: format!("{}_{}", root_target.name, platform_group_target.name),
                        src_select: platform_group_target
                            .src_select
                            .iter()
                            .map(|(platform, platform_target)| AliasTargetSelect {
                                key: format!(
                                    "@rules_playwright//tools/platforms:{}",
                                    platform.base_name()
                                ),
                                value: format!("//browsers:{}", platform_target.name),
                            })
                            .collect(),
                    })
            })
            .collect(),
    };

    let aliases_dir = out_dir.join("aliases");
    fs::create_dir(aliases_dir)?;
    fs::write(
        out_dir.join("aliases/BUILD.bazel"),
        template.render().unwrap(),
    )
}
