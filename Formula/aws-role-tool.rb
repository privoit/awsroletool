class AwsRoleTool < Formula
  desc "AWS Role Assumption Tool"
  homepage "https://github.com/privoit/awsroletool"
  version "1.0.0"
  url "https://github.com/privoit/awsroletool/releases/download/v1.0.0/AWS.Role.Tool-1.0.0-arm64.dmg"
  sha256 "19461526f140a11e80cebd619ead41a5ca57a09ddb072d51799d9c6a7cacb02a"

  def install
    system "hdiutil", "attach", "AWS.Role.Tool-1.0.0-arm64.dmg"
    system "cp", "-r", "/Volumes/AWS Role Tool/AWS Role Tool.app", "#{prefix}/AWS Role Tool.app"
    system "hdiutil", "detach", "/Volumes/AWS Role Tool"
  end

  def caveats
    <<~EOS
      After installing, you may need to run:
      brew link --force aws-role-tool
    EOS
  end
  
  def fetch
    # Use GitHub CLI (`gh`) to download private release assets
    system "gh", "release", "download", "v1.0.0",
           "-R", "privoit/awsroletool",
           "--pattern", "AWS.Role.Tool-1.0.0-arm64.dmg"
    super
  end

  def uninstall
    system "rm", "-rf", "#{prefix}/AWS Role Tool.app"
  end
end