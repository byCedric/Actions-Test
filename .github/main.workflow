workflow "Testing project" {
  on = "push"
  resolves = ["Install dependencies"]
}

action "Install dependencies" {
  uses = "bycedric/ci-expo@master"
  args = "ci"
  runs = "npm"
}
