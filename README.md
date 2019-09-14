# YouDownload

Download music from youtube. This package creates a local web application that allows you to paste a Youtube url into the UI to extract the audio from a Youtube video.  The audio is subsequently saved in `$CWD/www/yd/songs/mp3/` where `CWD=$(pwd)` of the git repo on your local machine.

## Flow Chart
```mermaid
sequenceDiagram
YouDownload-->>Youtube: Request video
Youtube ->> YouDownload: Video
YouDownload -->> Local Machine: Save audio from video 
```
## Setup and Installation
1. Make sure that `pwd` is within project root = `youdownload_project`
2. `python3 -m venv env; . env/bin/activate; pip install --upgrade pip; pip install -r requirements.txt; pip install -e .`
	 - This creates a virtual environment with the package installed as well as all the dependencies needed for the project
3. Change execution mode of `server.sh` script
    - run `chmod +x server.sh`
    - run `./server.sh`
    - navigate to `localhost:5000` on your web browser
4. Copy and paste a Youtube url into the UI
5. View your downloaded music within the project directory `$CWD/www/yd/songs/mp3`
# fibonacci_benchmarking
