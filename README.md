# animate-repos
bash script to create a gource animation from a folder of repositories and export as mp4

# Description
Running from a directory containing one or more git repositories, the script concatenates the logs of each and uses gource to produce a single animation demonstrating progress over time across all repositories.

# Requirements
- [gource](https://gource.io/)
- [ffmpeg](https://ffmpeg.org/)

# Usage
- Drop the script into a folder containing one or more local git repositories. 
- Adjust the file name and title as needed in the file. 
- Change the gource or ffmmpeg options to fit your needs (documentation for both at the links above), inlcuding
  - Size/resolution
  - Contents (labels, legends)
  - Effects
  - Compression and lossiness
  - etc.
- Run with bash
  - The animation will play in the gource viewer
  - ffmpeg will save the output to the filename designated in the second step 
