use askama::Template;
use std::{collections::HashMap, fs, io, path::Path};

use super::RootTarget;

#[derive(Template)]
#[template(
    source = r#"
load("@{{ rules_playwright_cannonical_name }}//playwright:defs.bzl", "select_exec")

package(default_visibility = ["//visibility:public"])
{% for target in select_targets %}
select_exec(
    name = "{{ target.label }}",
    src = select(
        {
            {%- for group in target.platform_groups %}
            "{{ group.name }}": "{{ group.alias_label }}",
            {%- endfor %}
        },
    ),
)
{% endfor %}
"#,
    ext = "txt"
)]
struct RootBuildFileTemplate<'a> {
    rules_playwright_cannonical_name: &'a str,
    select_targets: &'a [SelectTarget],
}

struct SelectTarget {
    label: String,
    platform_groups: Vec<SelectPlatformGroup>,
}

struct SelectPlatformGroup {
    name: String,
    alias_label: String,
}

pub fn write_build_file(
    out_dir: &Path,
    root_targets: &HashMap<String, RootTarget>,
    rules_playwright_cannonical_name: &str,
) -> io::Result<()> {
    let select_targets: Vec<SelectTarget> = root_targets
        .iter()
        .map(|(_browser, root_target)| SelectTarget {
            label: root_target.name.clone(),
            platform_groups: root_target
                .src_select
                .iter()
                .map(|(platform_group, platform_group_target)| {
                    let name_label: String = platform_group.clone().into();

                    SelectPlatformGroup {
                        name: format!(
                            "@{rules_playwright_cannonical_name}//tools/platforms:{}",
                            name_label
                        ),
                        alias_label: format!(
                            "//aliases:{}_{}",
                            root_target.name, platform_group_target.name
                        ),
                    }
                })
                .collect(),
        })
        .collect();

    fs::write(
        out_dir.join("BUILD.bazel"),
        RootBuildFileTemplate {
            select_targets: &select_targets,
            rules_playwright_cannonical_name,
        }
        .render()
        .unwrap(),
    )
}
