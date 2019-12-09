# opencvjs
Building opencv.js with Docker (based on [https://github.com/opencv/opencv/tree/master/platforms/js](https://github.com/opencv/opencv/tree/master/platforms/js))

## Run 
1. Set bash variable
`OPENCV_VERSION=4.1.2` or provide version from [opencv github releases](https://github.com/opencv/opencv/releases) (tested only for 4.1.2)
2. ```wget -q -O- "https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.tar.gz" | tar -xzC .```

3. **wasm** support  is enabled, if you don't need it remove `--build_wasm` from **build.sh** file
4. 
    ```
    docker build -t build-opencv-js .
    docker run --rm -v  ${PWD}/opencv-${OPENCV_VERSION}":/app/opencv build-opencv-js
    ```
If compilation is successful, resulted file   will be located at opencv-${OPENCV_VERSION}/compiled/bin/opencv.js
## For reducing number of compiled components:
Change **opencv_js.config.py** file and provide desired modules in **white_list** variable at the end of file.
(for now `[core, imgproc, objdetect, video, dnn, features2d, photo, aruco, calib3d]` are compiled)

Approximate time of processing: 30-50 minutes.
