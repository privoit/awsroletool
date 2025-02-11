class AwsRoleTool < Formula
  desc "AWS Role Assumption Tool"
  homepage "https://github.com/privoit/awsroletool"
  version "1.0.0"
  url "https://github.com/privoit/awsroletool/releases/download/v1.3.1/AWS.Role.Tool-1.0.0-arm64.dmg"
  sha256 "19461526f140a11e80cebd619ead41a5ca57a09ddb072d51799d9c6a7cacb02a"

  def install
    dmg_path = cached_download # Use Homebrew's cached path

    system "hdiutil", "attach", dmg_path, "-mountpoint", "/Volumes/AWS Role Tool"
    system "cp", "-r", "/Volumes/AWS Role Tool/AWS Role Tool.app", "#{prefix}/AWS Role Tool.app"
    system "hdiutil", "detach", "/Volumes/AWS Role Tool"
  end

  def caveats
    <<~EOS
      AWS Role Tool has been installed!
      Open it from Applications or run:
        open #{prefix}/AWS\ Role\ Tool.app
    EOS
  end
end
