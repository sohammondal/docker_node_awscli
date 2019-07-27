   
## Node.js & AWS Cli Docker Image :whale:

<p>
<img  alt="Version"  src="https://img.shields.io/badge/version-0.1.0-blue.svg?cacheSeconds=2592000"  />
<a  href="https://github.com/sohammondal/url_shortner#readme">
<img  alt="Documentation"  src="https://img.shields.io/badge/documentation-yes-brightgreen.svg"  target="_blank"  /></a>
<a  href="https://github.com/sohammondal/url_shortner/graphs/commit-activity">
<img  alt="Maintenance"  src="https://img.shields.io/badge/Maintained%3F-yes-green.svg"  target="_blank"  />
</a>
<a  href="https://github.com/sohammondal/url_shortner/blob/master/LICENSE">
<img  alt="License: ISC"  src="https://img.shields.io/badge/License-ISC-yellow.svg"  target="_blank"  />
</a><a  href="https://twitter.com/soham_sm_mondal">
<img  alt="Twitter: soham_sm_mondal"  src="https://img.shields.io/twitter/follow/soham_sm_mondal.svg?style=social"  target="_blank"  /></a></p>

> -  A custom docker image with Node.js & AWS CLI for easy build, test &
   deployment on AWS
> - The image also includes Python3  (<small>pre-requisite for AWS CLI)</small> and Boto3 <small>(Python AWS SDK module) </small> package
> - Can be used with Heroku, GitLab, Travis, Jenkins and any other popular CI tool


## Scripts

#### ./buildImage.sh
```bash 
$ ./buildImage.sh -v [VERSION]

# Example
$ ./buildImage.sh -v 1.1.2
```

#### ./releaseImage.sh
```bash 
# Usage
$ ./releaseImage.sh [OPTIONS]

# Options
# [OPTIONAL] Your DOCKER HUB username"
# [OPTIONAL] Your DOCKER HUB password"
# *** Both options -u & -p are reqd. during first run ***

#Example 
$ ./releaseImage.sh -u AB10299 -p MyPassword@123
```



## Author

  

  

  

👤 **Soham Mondal**

  

  

  

* Twitter: [@soham_sm_mondal](https://twitter.com/soham_sm_mondal)

  

  

* Github: [@sohammondal](https://github.com/sohammondal)

  

  

* LinkedIn: [Soham Mondal](https://www.linkedin.com/in/soham-sm-mondal/)

* Website: [sohammondal.com](https://sohammondal.com)

  

  

  

## 🤝 Contributing

  

  

  

Contributions, issues and feature requests are welcome!<br  />Feel free to check [issues page](https://github.com/sohammondal/url_shortner/issues).

  

  

  

## Show your support

  

  

  

Give a ⭐️ if this project helped you!

  

  

  

## 📝 License

  

  

  

Copyright © 2019 [Soham Mondal](https://github.com/sohammondal).<br  />

  

  

This project is [ISC](https://github.com/sohammondal/url_shortner/blob/master/LICENSE) licensed.