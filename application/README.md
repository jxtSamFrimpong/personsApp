
# Persons

Ultra Simple Persons Application



## Authors

- [@jxtsamfrimpong](https://github.com/jxtSamFrimpong)
An application for forgetfull dudes to remember individuals
Samuel Frimpong

## Acknowledgements

 - [Awesome Readme Templates](https://awesomeopensource.com/project/elangosundar/awesome-README-templates)
 - [Awesome README](https://github.com/matiassingers/awesome-readme)
 - [How to write a Good readme](https://bulldogjob.com/news/449-how-to-write-a-good-readme-for-your-github-project)

 





## Badges

Add badges from somewhere like: [shields.io](https://shields.io/)

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
[![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)
[![AGPL License](https://img.shields.io/badge/license-AGPL-blue.svg)](http://www.gnu.org/licenses/agpl-3.0)




## Run

To run this project run

```bash
  docker build -t persons-backend -f Dockerfile.api .
  docker build -t persons-webapp -f Dockerfile.web .
  docker build -t my-nginx -f Dockerfile.nginx .
  docker compose up -d --build --force-recreate --remove-orphans
```



## Contributing

Contributions are always welcome!

See `contributing.md` for ways to get started.

Please adhere to this project's `code of conduct`.




## Environment Variables

To run this project, you will need to set the following environment variables in your .env file or else it will use the default values
MONGODB_USERNAME    
MONGODB_PASSWORD    
MONGODB_DATABASE    
MONGODB_ROOT_PASSWORD   
MONGODB_HOST    
MONGODB_PORT    
BACKEND_IMAGE   
BACKEND_TAG 
API_PORT    
API_HOST    
WEB_APP_PORT    
WEB_APP_HOST    
WEB_APP_IMAGE   
WEB_APP_TAG 
PROXY_PORT  



## Features

- GET /persons  
        get all persons in database
- GET /persons/<id>     
        get a particular person
- POST /person/<id>
        post a particular person
- PUT /person/<id>          
        update information about a particular person
- DELETE /person<id>        
        delete a particular person




## FAQ

#### Question 1

Why this app?

-   There are people suffering from forgetfullness, amnesia and alzheimer's so something like this would be beneficial to them 



![Logo](https://img.icons8.com/dusk/512/null/human-head.png)


## 🚀 About Me
I'm a full DevOps Engineer at Develeap developer...

