workflow "Test Expo Action" {
  on = "push"
  resolves = ["Publish to Expo"]
}

action "Install dependencies" {
  uses = "bycedric/ci-expo/cli@master"
  runs = "npm"
  args = "ci"
}

action "Publish to Expo" {
  uses = "docker://bycedric/ci-expo"
  secrets = ["EXPO_USERNAME", "EXPO_PASSWORD"]
  runs = "expo login --username $EXPO_USERNAME --password $EXPO_PASSWORD && npx expo publish"
}
