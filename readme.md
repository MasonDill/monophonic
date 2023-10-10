<h1>Links</h1>
<ul>
    <li>Train models at <a>tensorflow.dill.digital</a></li>
    <li>Access the monophonic registry at <a>docker.dill.digital/monophonic:latest</a></li>
</ul>
<h1>How to Set Up a Training Enviroment</h1>
<ol>
    <li>Download the Primus Dataset</li>
    <ul><li><code>wget <a>https://grfia.dlsi.ua.es/primus/packages/primusCalvoRizoAppliedSciences2018.tgz</a></code></li></ul>
    <li>Extract the primus data</li>
    <ul>
        <li><code>gzip -d ./primusCalvoRizoAppliedSciences2018.tgz</code></li>
        <li><code>tar ./primusCalvoRizoAppliedSciences2018.tar </code></li>
    </ul>
    <li>Move the contents into one folder</li>
    <ul>
        <li><code>mv /path/to/primus/package_aa * /path/to/primus</code></li>
        <li><code>rmdir /path/to/primus/package_aa</code></li>
        <li><code>mv /path/to/primus/package_ab * /path/to/primus</code></li>
        <li><code>rmdir /path/to/primus/package_ab</code></li>
    </ul>
    <li>Download the Docker Image</li>
    <ul><li><code>docker pull docker.dill.digital/monophonic:latest</code></li></ul>
    <li>Launch the docker container</li>
    <ul>
        <h3>Using docker-compose</h3>
        <h4>create docker-compose.yml</h4>
        <pre><code>
            version: '3.7'
            services:
                monophonic:
                    image: docker.dill.digital/monophonic:latest
                    container_name: monophonic
                    restart: always
                    volumes:
                        - /path/to/primus:/Monophonic
                    ports:
                        - "8888:80"
                    volumes:
                        - /path/to/primus:/primus_data
                        - /path/to/save/models:/models
        </code></pre>
        <h4>Start the container</h4>
        <pre><code>
            docker-compose up -d
        </code></pre>
        <h3>Using docker</h3>
        <pre><code>
            docker run -v /path/to/primus --name monophonic
        </code></pre>
    </ul>
</ol>
<h1>Build & Publish a new docker image</h1>
<ol>
    <li>Build the image</li>
    <ul><li><code>docker build -t monophonic:TAG .</code></li></ul>
    <li>Upload to registry</li>
    <pre><code>
            docker tag monophonic:TAG docker.dill.digital/monophonic:TAG
            docker push docker.dill.digital/monophonic:TAG
    </code></pre>
</ol>
<h1>Sources & Useful Links</h1>
<ul>
    <li><a>https://www.mdpi.com/2076-3417/8/4/606</a></li>
    <li><a>https://grfia.dlsi.ua.es/primus/</a></li>
    <li><a>https://github.com/OMR-Research/tf-end-to-end</a></li>
    <li><a>https://www.tensorflow.org/install/docker</a></li>
    <li><a>https://github.com/tensorflow/tensorflow/releases/tag/v1.12.3</a></li>
    <li><a>https://hub.docker.com/r/tensorflow/tensorflow/tags?page=1&name=1.12</a></li>
    <li><a>https://www.youtube.com/watch?v=9lOWEZ-Q10E</a></li>
    <li><a>https://music-encoding.org/</a></li>
    <li><a>https://www.verovio.org/index.xhtml</a></li>
</ul>