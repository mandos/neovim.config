return {
	yaml = {
		schemaStore = {
			enable = true,
			url = "https://www.schemastore.org/api/json/catalog.json",
		},
		schemas = {
			-- TODO:
			-- kubernetes = "*.yaml",
			-- CircleCi
			["https://json.schemastore.org/circleciconfig.json"] = ".circleci/*.{yml,yaml}",
			-- Helm Chart.yaml
			["https://json.schemastore.org/chart.json"] = "Chart.{yml,yaml}",
			["https://json.schemastore.org/chart-lock.json"] = "Chart.lock",
			["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
			["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
			["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
			["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
			["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
			["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
			["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
			["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
			["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
			["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "{docker-,}compose*.{yml,yaml}",
			["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
			["file:///workspace/php/deptrac/deptrac-schema.json"] = "deptrac.yaml",
		},
		format = { enabled = false },
		validate = true,
		completion = true,
		hover = true,
	},
}
