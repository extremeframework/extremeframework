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

## References
* Official site: http://extremeframework.com/
* Documentation: http://extremeframework.com/start/
