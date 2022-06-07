<!-- Cloned from https://github.com/othneildrew/Best-README-Template.git -->
<div id="top"></div>
<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/FrankWilson88/Project-PADS">
    <img src="https://lh3.googleusercontent.com/i0ItE8oHQ1GWIMqN1PBl5rI4dL2hM0T9VUbBytBZeT0nA6VunnabiL4nPytawS0_Rsyd=s85" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">Project PADS</h3>

  <p align="center">
Personal Assistant and Deployment System
    <br />
    <a href="https://github.com/FrankWilson88/Project-PADS"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/github_username/repo_name">View Demo</a>
    ·
    <a href="https://github.com/FrankWilson88/Project-PADS/issues">Report Bug</a>
    ·
    <a href="https://github.com/FrankWilson88/Project-PADS/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

PADS(Personal Assistant and Deployment System) is General Purpose Artificial Intelligence designed to carry out every day business tasks.
It's purpose is to provide book keeping, employee timesheets, client tracking, automation, etc. It can do double entry accounting for hybrid manufacturing companies. 
None of the data is loaded as Environment Variables, so your interaction with PADS is between you and it.
It's original purpose was to serve as a website, with a relational historical database. 
Work on this project began in Python using the Django Framework on June 23, 2021 at 5:30pm.
The accounting database first came online Oct. 13th, 2021 at 11:48pm. The Bash Syntax was first created by Joe Corso on May 4th, 2022. 
It was previously codenamed Project Eniac, to pay homage to the original project of the same name.

<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* [Javascript](https://www.javascript.com/)
* [Python](https://www.python.org/)
* [Django](https://www.djangoproject.com/)
* [Bash](https://www.gnu.org/software/bash/)
* [MySQL](https://www.mysql.com/)

### Core Files

- pads/bash/
  - brain
  - functions.sh
  - log_msg.sh
  - response.sh
  - software_install.sh
  - styles.sh
- pads/conky/
- pads/memory/logs/
- pads/memory/profiles/
- pads/memory/requirements/
  - pads_requirements.txt
- pads/movies/
- pads/music/
- pads/pictures/
- pads/python/
- pads/websites/
  - accounting


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

This is an example of instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

If you are on Arch Linux, you can update first. The installer also updates before it installs anything.
* bash
  ```sh
  sudo pacman -Syyu
  ```
If you are on Rasbian/Debian, you can update first. The installer also updates before it installs anything.
* bash
  ```sh
  sudo apt-get update && sudo apt-get upgrade
  ```

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/FrankWilson88/Project-PADS.git
   ```
2. Open Directory you cloned the project to
   ```sh
   cd path/to/Project-PADS
   ```
3. Source the installer, and let it do the rest.
   ```sh
   source pads_1.0.0_installer
   ```

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

Usage: pads [-h|v|s|f] [ARG][ARG]
Options:

  -h                          Print the Usage and exit
  -v                          Print the Version and exit
  -s                          Install important Software and exit
  -f    [name|help][port]     Run any function and exit

Ex: pads -f help || pads -h || pads -f django testproject 8080 || pads -f delete testproject

_For more examples, please refer to the [Documentation](https://example.com)_

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [ ] E-commerce Website
    - [ ] Private Messaging on website
    - [ ] POS Sales directly through website (not a third-party).
    - [X] Accounting Database
- [ ] Bash Automation:
    - [ ] Cross Compatable:
       - [x] Manjaro
       - [x] Rasbian
       - [x] Debian
       - [ ] Windows
       - [ ] Mac OS
    - [x] Update Machine
    - [x] Log IP's connected to Modem.
    - [x] History, Success, Error Logs.
    - [x] Notes Log
    - [x] Backup Program
    - [x] Create, Delete, Start Django Project including user.
    - [x] Conky Panels for Sys Info
    - [ ] GUI
- [ ] Automate Customer Assistance:
    - [ ] Speech Module
    - [ ] Machine Learning
    - [ ] Search Distributors to find best prices, and make purchase's when inventory is at a given level.
    - [ ] Possibly search the web for buyers to connect to sellers (Assist in sales).
- [ ] Electron App
- [ ] Android App
- [ ] IOS App

See the [open issues](https://github.com/FrankWilson88/Project-PADS/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
## License

MIT License

Copyright (c) 2022 Army Glass

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Your Name - [@twitter_handle](https://twitter.com/twitter_handle) - email@email_client.com

Project Link: [https://github.com/FrankWilson88/Project-PADS/](https://github.com/FrankWilson88/Project-PADS/)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* []()
* []()
* []()

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/github_username/repo_name.svg?style=for-the-badge
[contributors-url]: https://github.com/github_username/repo_name/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/github_username/repo_name.svg?style=for-the-badge
[forks-url]: https://github.com/github_username/repo_name/network/members
[stars-shield]: https://img.shields.io/github/stars/github_username/repo_name.svg?style=for-the-badge
[stars-url]: https://github.com/github_username/repo_name/stargazers
[issues-shield]: https://img.shields.io/github/issues/github_username/repo_name.svg?style=for-the-badge
[issues-url]: https://github.com/FrankWilson88/Project-PADS/issues/
[license-shield]: https://img.shields.io/github/license/github_username/repo_name.svg?style=for-the-badge
[license-url]: https://github.com/github_username/repo_name/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
