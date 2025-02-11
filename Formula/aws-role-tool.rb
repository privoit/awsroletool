class AwsRoleTool < Formula
  desc "AWS Role Assumption Tool"
  homepage "https://github.com/privoit/awsroletool"
  version "1.0.0"
  url "https://github.com/privoit/awsroletool/releases/download/v1.0.0/AWS.Role.Tool-1.0.0-arm64.dmg"
  sha256 "19461526f140a11e80cebd619ead41a5ca57a09ddb072d51799d9c6a7cacb02a"

  def install
    dmg_path = cached_download

    # Mount DMG
    system "hdiutil", "attach", dmg_path
    app_path = "/Volumes/AWS Role Tool/AWS Role Tool.app"

    # Ensure App Exists
    unless File.exist?(app_path)
      raise "❌ App not found in DMG! Check the volume name."
    end

    # Copy App to Homebrew Prefix
    cp_r app_path, prefix

    # Unmount DMG
    system "hdiutil", "detach", "/Volumes/AWS Role Tool"
  end

  def caveats
    <<~EOS
      ✅ AWS Role Tool has been installed!
      Open it from **Applications** or run:
        open #{opt_prefix}/AWS\ Role\ Tool.app
    EOS
  end
end
