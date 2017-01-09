# AppDynamics Chef Automation Lab

This lab walks you through a brief example leveraging a Chef recipe to provision, and install, AppDynamics on top of a Tomcat instance.

## Pre-requisites

### Chef

### Chef Pre-reqs
This lab requires the Chef SDK.  If you're leveraging the Ravello Blueprint, this pre-req is already provided for you.  If not, you need to install the SDK as described in [https://learn.chef.io/tutorials/learn-the-basics/rhel/aws/set-up-a-machine-to-manage/](https://learn.chef.io/tutorials/learn-the-basics/rhel/aws/set-up-a-machine-to-manage/).

Note that depending on your environment, some steps may be slightly different.

#### Chef Basics Tutorial

If you haven't worked with Chef before, you need to start by working through the basic Chef automation lab - [https://learn.chef.io/tutorials/learn-the-basics/rhel/](https://learn.chef.io/tutorials/learn-the-basics/rhel/).  It's strongly recommended you walk through all basic steps including:

   * Setup an instance to manage
   * Configure a resource
   * Configure a package and service
   * Make your recipe more manageable
   
You can choose any of the available operating environments, but an easy way to complete the walk-through is by following the instructions for **Amazon Web Services** but leverage a virtual environment in Raello.

If you are already leveraging the Ravello Blueprint created for the Kitchen Sink Labs, you can simply use it for your testing.

#### Chef Terminology
Chef maintains extensive documentation, the following is a helpful overview of the core concepts and definitions regarding cookbooks vs recipes - [https://docs.chef.io/cookbooks.html](https://docs.chef.io/cookbooks.html).

### AppDynamics Chef Cookbook
A reference Chef cookbook for deploying AppDynamics agents is maintained at [https://github.com/Appdynamics/appdynamics-cookbooks.git](https://github.com/Appdynamics/appdynamics-cookbooks.git).

You'll need to pull this down before starting the lab.  A helper script **clone-appd-chef-cookbook.sh* is provided for you as part of the lab directory.

### Cars Reference App
We'll leverage the **Cars Sample App** that is packaged in the **${KITCHEN_SINK_HOME}/reference-apps/** sub-folder.  You will need to familiarize yourself with the application, and ultimately manually build the WAR file as described to be leveraged in this lab.

## Overview

To complete this lab, we're going to leverage the existing 

### Creating a Tomcat Cookbook that Includes AppDynamics

#### Creating a working directory
We're going to work out of the ${LAB_HOME}/cookbooks sub-folder, if it doesn't already exist create the sub-folder **/cookbooks** now.

#### Creating the template cookbook
We'll create a template cookbook - tomcat-appd - as described in [https://learn.chef.io/tutorials/learn-the-basics/rhel/aws/make-your-recipe-more-manageable/](https://learn.chef.io/tutorials/learn-the-basics/rhel/aws/make-your-recipe-more-manageable/)

From ${LAB_HOME}, run the command:

```
chef generate cookbook cookbooks/learn_chef_tomcat
```

After creating the cookbook template, your sub-folder package should look similar to the following:

```
OSX: steve.sturtevant@osxltsturt.local in ~/git/appdynamics-samples/devops-samples/devops-kitchen-sink-lab/labs/chef-automation on master*
🐳  tree -L 1 cookbooks/learn_chef_tomcat/
cookbooks/learn_chef_tomcat/
├── Berksfile
├── README.md
├── chefignore
├── cookbooks
├── learn_chef_tomcat
├── metadata.json
├── metadata.rb
├── nodes
├── recipes
├── spec
└── test
```

This will create a basic cookbook template for us to work with.  In the next steps we'll add Tomcat, and overlay AppDynamics.

### Chef Dependencies

#### Specifying package dependencies

Our cookbook is going to depend on other packages, specifically Java and Tomcat.  Rather than re-defining how those are insalled on our system, we'll leverage pre-existing cookbooks that are already available for us in the chef supermarket - [https://supermarket.chef.io/](https://supermarket.chef.io/).  

Berkshelf - [https://docs.chef.io/berkshelf.html] (https://docs.chef.io/berkshelf.html) - is a package dependency manager for Chef.  We'll use it to install and reference the dependencies our lab needs.

The Chef Supermarket is similar to Dockerhub in that it represents a public repository you can leverage to access pre-built cookbooks and recipes.

As an exercise, update the Berksfile found in *cookbooks/learn_chef_tomcat/Berksfile* to specify that we depend on the following cookbooks in the Chef Supermarket:

   * java_se cookbook version 8.112.1
   * tomcat cookbook version 2.3.4  

**NOTE** syntax of the Berksfile is covered in the Berkshelf link shared above.

Your Berksfile should look something like this:

```
source 'https://supermarket.chef.io'

cookbook <java-cookbok>, <version>
cookbook <tomcat-cookbook>, <version>

metadata
```

#### Downloading dependencies for local usage

This lab is going to work with chef in local mode, so we need to explicitly download our cookbook dependencies and store them in a local path which will be accessible when we run our recipes.  

From our ${LAB_HOME}, which should be **${SOME_DIR}/devops-kitchen-sink-lab/labs/chef-automation** run the following - *berks vendor* - command:

```
OSX: steve.sturtevant@osxltsturt.local in ~/git/appdynamics-samples/devops-samples/devops-kitchen-sink-lab/labs/chef-automation on master*

🐳  berks vendor cookbooks/ -b cookbooks/learn_chef_tomcat/Berksfile
```

This tells Berks to resolve and download the dependencies we've listed in our Berksfile, and store them in the *cookbooks* sub-folder.  If you've done this successfully, it should look similar to the following:

```
OSX: steve.sturtevant@osxltsturt.local in ~/git/appdynamics-samples/devops-samples/devops-kitchen-sink-lab/labs/chef-automation on master*

🐳  tree -L 1 cookbooks/
cookbooks/
├── apt
├── compat_resource
├── homebrew
├── java
├── java_se
├── learn_chef_tomcat
├── ohai
├── tomcat
└── windows
```


### Creating a Tomcat Recipe



