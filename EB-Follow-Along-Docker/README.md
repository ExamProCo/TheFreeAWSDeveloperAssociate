# Elastic Beanstalk Follow Along

If you did the Elastic Beanstalk Follow Along section, you noticed the Dockerfile creation is missing. In the [Single-Container Dockerfile section](https://www.youtube.com/watch?v=RrKRN9zRBWs&t=7098s), Andrew shows only the result by accessing the cloud9 URL. Here we are going to see which commands you need to do to catch up and finish the section.

This is NOT a Docker tutorial. If you need to learn what Docker is, you can check the official documentation.

## Missing steps

1. Create Docker files
2. Edit Elastic Beanstalk platform configuration
3. Build an image from your Dockerfile
4. Run locally your container

Before running the commands below, be sure you are in the `~/environment/study-sync` path.

### Create Docker files

You have to create the following files:

- `Dockerfile` which is a text document that contains all the commands to assemble our docker image
- `.dockerignore`

And copy/paste from the [GitHub repository](https://github.com/ExamProCo/TheFreeAWSDeveloperAssociate)

### Edit Elastic Beanstalk platform configuration

For now, Elastic Beanstalk can only deploy Node.js application.
We have to change the configuration to deploy docker images.

In cloud9 terminal, run the following eb command and answer `Y`:

```
eb platform select
```

### Build an image from your Dockerfile

To build you docker image, run the following command in your cloud9 terminal:

```
docker build --tag study-sync:1.0 .
```

It will build your image with the commands defined in your Dockerfile and assign a tag to it.

To confirm your image, run the following command:

```
docker images
```

### Run locally your container

Now your image is created you can locally run your container with the command:

```
docker run --env PORT=8080 --publish 8080:8080 study-sync:1.0
```

This command will run your image on local port 8080 and container port 8080.

## Conclusion

You are now good to go and able to finish the [Elastic Beanstalk Follow Along section](https://www.youtube.com/watch?v=RrKRN9zRBWs&t=7098s)...

Don't forget to join the #AWSCertified Discord channel https://discord.gg/baAq96C

Happy #AWSCertified training and be sure to pass your exam!
