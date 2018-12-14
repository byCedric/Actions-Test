workflow "Testing project" {
  on = "push"
  resolves = ["Test code"]
}

action "Install dependencies" {
  uses = "docker://bycedric/ci-expo"
  args = "ci"
  runs = "npm"
}

action "Test code" {
  uses = "docker://bycedric/ci-expo"
  needs = ["Install dependencies"]
  args = "run test-ci"
  runs = "npm"
}
