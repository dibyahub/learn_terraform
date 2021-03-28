terraform {
  backend "remote" {
    organization = "MeetupDemo"

    workspaces {
      prefix = "collab-"
    }
  }
}
