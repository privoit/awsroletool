class AwsRoleTool < Formula
  desc "AWS Role Assumption Tool"
  homepage "https://github.com/privoit/awsroletool"
  version "1.0.0"
  url "https://github.com/privoit/awsroletool/releases/download/v1.3.2/AWS.Role.Tool-1.0.0-arm64.dmg"
  sha256 "19461526f140a11e80cebd619ead41a5ca57a09ddb072d51799d9c6a7cacb02a"

  def install
    dmg_path = cached_download # Use Homebrew’s cached path

    # Attach the DMG and find the correct mount point dynamically
    mount_output = `hdiutil attach #{dmg_path} -nobrowse`
    mount_point = mount_output.lines.find { |line| line.include?("/Volumes/") }&.split("\t")&.last&.strip

    if mount_point.nil?
      odie "❌ Failed to determine the mounted volume for AWS Role Tool."
    end

    # Copy the app from the dynamically detected mount point
    system "cp", "-r", "#{mount_point}/AWS Role Tool.app", "#{prefix}/AWS Role Tool.app"

    # Detach the volume
    system "hdiutil", "detach", mount_point
  end

  def caveats
    <<~EOS
      � AWS Role Tool has been installed!
      Open it from Applications or run:
        open #{prefix}/AWS\ Role\ Tool.app
    EOS
  end
end
