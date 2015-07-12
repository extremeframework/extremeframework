# Extreme Framework

Extreme Framework is a clean PHP web development framework to help build high quality applications rapidly. It has no footprint and limitation for developers. 

### Clean And Well-Managed
Extreme Framework uses MVC architecture with de-facto standards like ORM and Smarty template engine. This structure helps developers write clean and well-managed codes easily and quickly. In addition, an architecture with loose coupling components helps build large-scale applications easily with no hassle.

### Freedom With No Footprint
Extreme Framework is actually a concept of “no-framework”. The base system is simply a simple routing mechanism to route requests to the right handlers. There is almost no footprint, limitation or constraints from the framework. Developers are left with all freedom, creativity and space to do whatever they wish.

### Highly Secure
Extreme Framework has a full built-in system with core authentication, access right control and workflow management components. These components are ready, complete and extremely flexible for developers to build applications quickly with all security, access control and workflow features beforehand.

### Lightweight and Intuitive
Extreme Framework is so lightweight and intuitive. There is almost no namespace, convention, constraints or configuration to learn about. Anyone with basic PHP knowledge can start with Extreme Framework very quickly.

## Sample snippet
```php
    <?php
    class GreetingController 
    { 
        function helloAction() { 
            $model = new UserModel();
    
            $model->find();
            
            $users = array();
    
            while ($model->fetch()) {
                $users[] = clone $model;
            }
    
            $smarty = Framework::load('smarty');
    
            $smarty->assign('users', $users);
    
            $smarty->display('users.tpl');
        } 
    } 
    
    // with users.tpl:
    <{foreach from=$users item=user}>
        Hello <{$user->NAME}><br/>
    <{/foreach}>
```

##Setup Instructions

1. [Fork and clone the repo.](https://help.github.com/articles/fork-a-repo)
2. ...

## Resources
* Official site: http://extremeframework.com/
* Documentation: http://extremeframework.com/start/

## Issues

Find a bug or want to request a new feature?  Please let us know by submitting an [issue](https://github.com/extremeframework/extremeframework/issues?state=open).

## Contributing

Anyone and everyone is welcome to contribute. We follow the "fork-and-pull" Git workflow below for submitting patches and additions.

 1. Fork the repo on GitHub
 2. Commit changes to a branch in your fork
 3. Pull request "upstream" with your changes
 4. Merge changes in to "upstream" repo

NOTE: Be sure to merge the latest from "upstream" before making a pull request!

### Contributing code written by others

Please do not contribute code you did not write yourself, unless you are certain you have the legal ability to do so. Also ensure all code contributed can be licensed under the MIT License.

## Licensing
The MIT License (MIT)

Copyright (c) 2011-2015 VIETMAI Solutions Corporation

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

A copy of the license is available in the repository's [LICENSE](LICENSE) file.
