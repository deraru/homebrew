class Ndenv < Formula
  homepage "https://github.com/riywo/ndenv"
  url "https://github.com/riywo/ndenv/archive/v0.4.0.tar.gz"
  version "0.4.0"
  sha256 "1a85e4c0c0eee24d709cbc7b5c9d50709bf51cf7fe996a1548797a4079e0b6e4"

  head "https://github.com/riywo/ndenv.git"

  def install
    inreplace "libexec/ndenv", "/usr/local", HOMEBREW_PREFIX
    prefix.install Dir["*"]
  end

  def caveats; <<-EOS.undent
    To use Homebrew's directories rather than ~/.ndenv add to your profile:
      export NDENV_ROOT="#{prefix}"
      export PATH="$NDENV_ROOT/bin:$PATH"

    To enable shims and autocompletion add to your profile:
      if which ndenv > /dev/null; then eval "$(ndenv init -)"; fi
    EOS
  end

  test do
    shell_output("eval \"$(#{bin}/ndenv init -)\" && ndenv versions")
  end
end
