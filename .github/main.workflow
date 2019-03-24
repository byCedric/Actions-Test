workflow "Test Expo Action" {
  on = "push"
  resolves = ["Publish to Expo"]
}

action "Install dependencies" {
  uses = "bycedric/ci-expo/cli@master"
  runs = "npm"
  args = "ci"
}

action "Login with Expo" {
  uses = "bycedric/ci-expo/cli@master"
  secrets = ["EXPO_USERNAME", "EXPO_PASSWORD"]
  args = "expo login --username $EXPO_USERNAME --password $EXPO_PASSWORD"
}

action "Publish to Expo" {
  uses = "docker://bycedric/ci-expo"
  needs = ["Install dependencies"]
  secrets = ["EXPO_USERNAME", "EXPO_PASSWORD"]
  runs = "sh -c 'expo login --username $EXPO_USERNAME --password $EXPO_PASSWORD && npx expo publish'"
}
