workflow "Testing project" {
  on = "push"
  resolves = ["Test code"]
}

action "Install dependencies" {
  uses = "actions/npm@master"
  args = "ci"
}

action "Test code" {
  uses = "actions/npm@master"
  needs = ["Install dependencies"]
  args = "run test-ci"
}
