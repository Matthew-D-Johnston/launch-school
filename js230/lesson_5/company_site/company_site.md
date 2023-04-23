###### JS230 DOM and Asynchronous Programming with JavaScript > Putting it All Together

---

## Assignment: Team Member Profile Models

We're going to revisit our Space Design website from an earlier course, and add more information about our team members. Our designer has come up with a common means of displaying more information as an overlay on the page content, called a modal. A modal acts like a separate sub-window of content that can be closed in order to return to the main content, all without leaving the page. These always use CSS positioning to place the modal and an optional overlay element over the top of the content. The overlay acts as a blocking element to prevent interacting with the page underneath the modal. It is good practice to have at least a close link and a close action bound to clicking on the overlay that will remove the modal and the overlay.

### My Code:

###### HTML

```html
<!DOCTYPE html>
<html lang="en-US">
  <head>
    <title>Space Design | Team</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="initial-scale=1.0" />
    <link rel="stylesheet" href="site.css" />
    <script src="team.js"></script>
  </head>
  <body>
    <header>
      <h1>
        <a href="home.html">SpaceDesign</a>
      </h1>
      <nav>
        <ul>
          <li><a href="home.html">Home</a></li>
          <li><a href="projects.html">Projects</a></li>
          <li><a href="team.html" class="active">Team</a></li>
        </ul>
      </nav>
    </header>

    <main>
      <div id="team" class="column">
        <article>
          <h2>Team</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniadolor</p>
          <ul>
            <li>
              <a href="#">
                <img src="images/img_kevin.jpg" alt="Kevin Wang" />
                Kevin
              </a>
            </li>
            <li>
              <a href="#">
                <img src="images/img_louis.jpg" alt="Louis Burton" />
                Louis
              </a>
            </li>
            <li>
              <a href="#">
                <img src="images/img_kasper.jpg" alt="Kasper Salto" />
                Kasper
              </a>
            </li>
            <li>
              <a href="#">
                <img src="images/img_chris.jpg" alt="Chris Lee" />
                Chris
              </a>
            </li>
          </ul>
        </article>
      </div>
    </main>

    <footer>
      <p>
        Lorem ipsum dolor sit amet, consectetu
        <br />
        incididunt ut labore et dolore magna aliqua. Ut enim ad
      </p>
      <ul>
        <li><a href="#" class="twitter">Twitter</a></li>
        <li><a href="#" class="facebook">Facebook</a></li>
        <li><a href="#" class="email">Email</a></li>
        <li><a href="#" class="instagram">Instagram</a></li>
      </ul>
    </footer>
  </body>
</html>
```

###### CSS

```css
body {
  padding: 75px 0 0 0;
  margin: 0;
  font: normal 20px "Avenir", Helvetica, Arial, sans-serif;
  text-align: center;
  color: #45494d;
  background: #2f2840 url("images/bg_body.gif") 50% 0 repeat;
}

a {
  text-decoration: none;
  color: #3e59b2;
}

.column {
  max-width: 1000px;
  margin: 0 auto;
}

nav {
  padding: 0 0 35px 0;
  font-size: 24px;
  text-transform: uppercase;
}

nav ul { padding: 0; }

nav li {
  display: inline;
  padding: 0 42px;
}

nav a {
  color: #cacaca;
}

nav a.active {
  font-weight: bold;
  color: #6db9ff;
}

main {
  padding: 75px 0 0 0;
  background: #ffffff;
}

h1 a {
  display: block;
  width: 298px;
  height: 243px;
  margin: 0 auto 50px auto;
  text-indent: -9000px;
  background: transparent url("images/logo.png") 0 0 no-repeat
}

h2 {
  font-size: 36px;
  font-weight: 600;
}
h2:before,
h2:after {
  display: inline-block;
  padding: 0 24px;
  font-size: 22px;
  vertical-align: 5px;
  content: "\2022";
}

h3 {
  font-size: 24px;
  color: #3e59b2;
}

article {
  padding: 0 110px 100px 110px;
}

article p {
  text-align: justify;
}

footer {
  padding: 75px 0;
  color: #b2b2b2;
  background: #e7e7e7;
}

footer p {
  padding: 0 0 40px 0;
}

footer ul {
  padding: 0;
  margin: 0;
}

footer li {
  display: inline-block;
  padding: 0 62px;
}

footer li a {
  display: block;
  width: 46px;
  height: 46px;
  text-indent: -8685px;
  overflow: hidden;
  background: transparent url("images/icons_social-media.png") 0 0 no-repeat;
}
footer li a.facebook { background-position: 0 -46px; }
footer li a.email { background-position: 0 -92px; }
footer li a.instagram { background-position: 0 -138px; }

#projects article {
  padding: 0 0 50px 0;
}

#projects article + article {
  padding-top: 60px;
  border-top: 1px solid #cccccc;
}

#projects article p {
  padding: 0 110px;
  margin: 0;
}

#projects figure {
  padding: 0 30px 20px 30px;
  margin: 0;
}

#projects figure img {
  display: block;
  width: 100%;
}

#team article {
  padding: 0 0 100px 0;
}

#team p {
  padding: 0 110px 100px 110px;
}

#team ul { padding: 0; }

#team li {
  display: inline-block;
  padding: 0 30px;
  font-size: 24px;
}

#team li img {
  display: block;
  margin: 0 0 20px 0;
}

div.modal {
  visibility: hidden;
  position: fixed;
  top: 30px;
  left: 50%;
  height: 500px;
  width: 800px;
  margin-left: -400px;
  background: #ffffff;
}

header.modal {
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  padding-left: 60px;
  gap: 25px;
}

h3.modal {
  display: inline;
  position: relative;
  top: 113px;
}

img.modal {
  display: inline;
  height: 13%;
  width: 13%;
  position: relative;
  top: 100px;
}

#close {
  display: inline;
  align-self: flex-end;
  position: fixed;
  top: 53px;
  left: 89%;
  cursor: pointer;
}

p.modal {
  position: relative;
  top: 100px;
  text-align: justify;
  padding-left: 60px;
  padding-right: 60px;
}

.overlay {
  visibility: hidden;
  position:fixed;
  left: 0;
  top: 0;
  width: 100vw;
  height: 100vh;
  background-color: rgba(0,0,0,0.4);
}

@media (max-width: 875px) {
  #team li {
    width: 48%;
    padding: 0 0 30px 0;
  }

  #team li img {
    margin: 0 auto;
  }
}

@media (max-width: 768px) {
  body {
    padding-top: 45px;
  }

  h1 a {
    width: 223px;
    height: 182px;
    margin-bottom: 30px;
    background-size: cover;
  }

  nav {
    padding-bottom: 0;
  }

  main {
    padding-top: 40px;
  }

  article {
    padding: 0 40px 50px 40px;
  }

  footer {
    padding: 35px 0;
  }

  footer li {
    padding: 0 32px;
  }

  #projects article p {
    padding: 0 30px;
  }
}

@media (max-width: 480px) {
  body {
    padding: 0;
    font-size: 16px;
  }

  body > header {
    padding: 15px 20px;
  }

  h1 {
    float: left;
    margin: 20px 0 0 0;
  }

  h1 a {
    width: auto;
    height: 40px;
    padding: 10px 0 0 55px;
    text-indent: 0;
    font-size: 22px;
    color: #ffffff;
    background-position: -20px 0;
    background-size: 90px auto;
  }

  h2 { font-size: 26px; }

  h2:before,
  h2:after {
    vertical-align: 0;
  }

  h3 { font-size: 22px; }

  nav {
    font-size: 16px;
    text-align: right;
  }

  nav ul {
    margin: 0;
  }

  nav li {
    display: block;
    padding: 5px 0;
  }

  footer {
    padding: 20px 0;
  }

  footer li {
    padding: 0 18px;
  }

  #team p {
    padding: 0 30px 40px 30px;
  }
}
```

###### JavaScript

```javascript
"use strict";

const TeamBios = { 'Kevin Wang': 'Kevin Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                   'Louis Burton': 'Louis Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                   'Kasper Salto': 'Kasper Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                   'Chris Lee': 'Chris Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
                  };

function createModal(image, name, bio) {
  let modal = document.createElement('div');
  image.setAttribute('class', 'modal');

  let modalHeader = document.createElement('header');
  modalHeader.setAttribute('class', 'modal');
  modalHeader.appendChild(image);
  let h3 = document.createElement('h3');
  h3.innerText = name;
  h3.setAttribute('class', 'modal');
  modalHeader.appendChild(h3);
  let closeImg = document.createElement('img');
  closeImg.setAttribute('src', 'images/icon_close.png');
  closeImg.setAttribute('alt', 'close image');
  closeImg.setAttribute('id', 'close');
  modalHeader.appendChild(closeImg);
  modal.appendChild(modalHeader);
  
  let modalSection =  document.createElement('section');
  modalSection.setAttribute('class', 'modal');
  let sectionP = document.createElement('p');
  sectionP.innerText = bio;
  sectionP.setAttribute('class', 'modal');
  modalSection.appendChild(sectionP);
  modal.appendChild(modalSection);

  modal.setAttribute('class', 'modal');

  return modal;
}

document.addEventListener('DOMContentLoaded', () => {
  let ulTeamList = document.querySelector('article ul');
  let aListTeamMembers = document.querySelectorAll('article ul li a');

  for (let index = 0; index < aListTeamMembers.length; index += 1) {
    let aTeamMember = aListTeamMembers[index];

    aTeamMember.addEventListener('click', event => {
      event.preventDefault();

      if (document.querySelector('.modal')) {
        document.querySelector('.modal').remove();
      }

      if (document.querySelector('.overlay')) {
        document.querySelector('.overlay').remove();
      }

      let teamMemberImg = aTeamMember.querySelector('img').cloneNode();
      let teamMemberName = teamMemberImg.getAttribute('alt');
      let teamMemberBio = TeamBios[teamMemberName];

      let modal = createModal(teamMemberImg, teamMemberName, teamMemberBio);
      let main = document.querySelector('main');

      let modalOverlay = document.createElement('div');
      modalOverlay.setAttribute('class', 'overlay');
      modalOverlay.append(modal);
      main.appendChild(modalOverlay);

      modal.style.visibility = 'visible';
      modalOverlay.style.visibility = 'visible';

      setTimeout(() => {
        document.querySelector('html').addEventListener('click', event => {
          console.log(event.target);
          if (event.target.getAttribute('class') !== 'modal') {
            modal.style.visibility = 'hidden';
            modalOverlay.style.visibility = 'hidden';
          }
        });
      }, 0);
    });
  }
});
```

