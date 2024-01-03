
class Warden < Formula
  desc "Warden is a CLI utility for working with docker-compose environments"
  homepage "https://warden.dev"
  license "MIT"
  version "0.14.2"
  url "https://github.com/wardenenv/warden/archive/0.14.2.tar.gz"
  sha256 "385b99cab2383acc043ac5ecc0a83f544ea4fa2837115d81c60299b18a55ece0"
  head "https://github.com/wardenenv/warden.git", :branch => "main"

  depends_on "gettext"
  depends_on "pv" => :recommended

  def install
    prefix.install Dir["*"]
  end

  def caveats
    <<~EOS
      Warden manages a set of global services on the docker host machine. You
      will need to have Docker installed and docker-compose available in your
      local $PATH configuration prior to starting Warden.

      To start warden simply run:

        warden svc up

      This command will automatically run "warden install" to setup a trusted
      local root certificate and sign an SSL certificate for use by services
      managed by warden via the "warden sign-certificate warden.test" command.

      To print a complete list of available commands simply run "warden" without
      any arguments.

      Documentation is available at: https://docs.warden.dev
    EOS
  end
end
