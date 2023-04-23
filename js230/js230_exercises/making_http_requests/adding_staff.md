##### JS230 – Front-end Development with JavaScript > Making HTTP Requests

---

### Adding Staff

---

#### Problem

Implement a form for adding new staff, and then use the booking app API to add the staff to the database. Your implementation should handle the different possible responses of the server and inform the user of the outcome.  

#### My Solution

```html
<!DOCTYPE html>
<html lang="en">
  <script>
    document.addEventListener('DOMContentLoaded', () => {
      let submit = document.getElementById('submit');
      let email = document.getElementById('email');
      let name = document.getElementById('name');

      submit.addEventListener('click', event => {
        event.preventDefault();

        if (email.value === '' || name.value === '') {
          alert('Staff cannot be created. Check your inputs.');
        } else {
          let request = new XMLHttpRequest();
          request.open('POST', 'http://localhost:3000/api/staff_members');
          request.setRequestHeader('Content-Type', 'application/json; charset=utf-8');
          request.setRequestHeader('Access-Control-Allow-Origin', 'public/add_staff.html');

          let data = { name: `${name.value}`, email: `${email.value}` };
          let json = JSON.stringify(data);

          request.send(json);
        }

        email.value = '';
        name.value = '';
      });
    });
  </script>
  <head>
    <meta charset='utf-8'>
    <title>Add Staff</title>
  </head>
  <body>
    <form>
      <div>
        <label for="email">Email: </label>
        <input type="text" name="email" id="email" required>
      </div>
      <div>
        <label for="name">Name: </label>
        <input type="text" name="name" id="name" required>
      </div>
      <div>
        <input type="submit" value="Submit" id="submit">
      </div>
    </form>
  </body>
</html>
```

#### LS Solution

You can try this solution by placing `ex3.html` into the public directory.  

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8">
    <title>Exercise 3</title>
    <style>
      dl {
        border: 3px double #ccc;
        padding: 0.5em;
      }
      dt {
        float: left;
        clear: left;
        width: 100px;
        text-align: right;
        font-weight: bold;
        color: #f0595b;
      }
      dt::after {
        content: ":";
      }
      dd {
        margin: 0 0 0 110px;
        padding: 0 0 0.5em 0;
      }
      
      input[type="submit"] {
        color: #fff;
        background: #f0595b;
        border-color: #f0595b;
        border-radius: 5px;
        width: 100px;
        height: 50px;
      }
    </style>
  </head>
  <body>
    <form method="post" action="/api/staff_members">
      <dl>
        <dt>
          <label for="email">Email</label>
        </dt>
        <dd>
          <input type="email" id="email" name="email">
        </dd>
        <dt>
          <label for="name">Name</label>
        </dt>
        <dd>
          <input type="text" id="name" name="name">
        </dd>
      </dl>
      <input type="submit">
    </form>
    <script>
      function formDataToJson(formData) {
        const json = {};
        for (const pair of formData.entries()) {
          json[pair[0]] = pair[1];
        }
        
        return json;
      }
      
      const form = document.querySelector('form');
      form.addEventListener('submit', event => {
        event.preventDefault();
        const formData = new FormData(form);
        const json = JSON.stringify(formDataToJson(formData));
        const xhr = new XMLHttpRequest();
        
        xhr.open('POST', form.action);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(json);
        
        xhr.addEventListener('load', event => {
          switch(xhr.status) {
            case 201:
              const data = JSON.parse(xhr.response);
              alert(`Sucessefully created staff with id: ${data.id}`);
              form.reset();
              break;
            case 400:
              alert(xhr.responseText);
          }
        });
      });
    </script>
  </body>
</html>
```

