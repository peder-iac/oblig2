tjeneste = "ordre"
runtime  = "vm"
prefix   = "10.10.0.0/24"

# En offentlig nøkkel uten tilhørende privat nøkkel: ingen kan logge inn på
# VM-en, og det trenger du heller ikke. Vil du logge inn, bytt den ut med
# innholdet i din egen .pub-fil. Den PRIVATE nøkkelen skal aldri i repoet.
ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGMQ32gu8mGVI86gkUex5JsBeg7WC58bsUOVuxmeHDJW oblig2-ingen-privat-nokkel"

ekstra_regler = {
  "allow-tcp-8460" = { port = 8460, kilde = "172.16.41.0/24", prioritet = 110 }
}
