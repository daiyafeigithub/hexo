title: ' Java常用设计模式总结及应用场景分析'
author: 青尘
tags:
  - 设计模式
categories:
  - K
date: 2021-01-01 21:20:00
---

常用的设计模式分类：
创建型（创建一个对象）：单例模式、工厂模式、抽象工厂模式
结构型（将几个对象组织成一个结构）：桥接模式、外观模式、代理模式
行为型（多个对象间的通信）：观察者模式、策略模式
其中，工厂模式、桥接模式、策略模式有点像，放在一起理解（几个对象具有共同特征，因此继承共同的接口，然后通过工厂、桥去访问）。另外，工厂模式和外观模式（几个对象间有先后关系，是串行的，而非工厂模式中的并行，因此几个对象组合成一个外观类，通过这个外观类来访问）区别很明显，也因此放在一起理解。

### 设计模式定义

被反复使用的，代码设计经验的总结。

### 设计模式的原则

总结起来，就是多用接口/抽象类，从而增加代码的可扩展性(减少修改代码)。降低模块间的依赖和联系。
体现了OOP的模块化、可扩展性等特征。

### 工厂模式

定义与使用场合：现在需要创建几个对象，且这几个对象有共同特征，则不需要具体创建各个对象，而是创建对象工厂类即可。
一般常用静态工厂模式。
例子：发送邮件和短信（共同特征：发送的消息）

```java
public interface Sender {  
    public void Send();  
}  
public class MailSender implements Sender {  
    @Override  
    public void Send() {  
        System.out.println("this is mailsender!");  
    }  
}  
public class SmsSender implements Sender {  

    @Override  
    public void Send() {  
        System.out.println("this is sms sender!");  
    }  
}  
public class SendFactory {  

    public static Sender produceMail(){  
        return new MailSender();  
    }  

    public static Sender produceSms(){  
        return new SmsSender();  
    }  
}  
public class FactoryTest {  

    public static void main(String[] args) {      
        Sender sender = SendFactory.produceMail();  
        sender.Send();  
    }  
}  
```

### 抽象工厂模式

工厂方法模式有一个问题就是，类的创建依赖工厂类，也就是说，如果想要拓展程序，必须对工厂类进行修改，这违背了闭包原则。
定义与使用场景：同上。
例子：同上。

```java
public interface Provider {  
    public Sender produce();  
}  
public class SendMailFactory implements Provider {  

    @Override  
    public Sender produce(){  
        return new MailSender();  
    }  
}  
public class SendSmsFactory implements Provider{  

    @Override  
    public Sender produce() {  
        return new SmsSender();  
    }  
}  
public class Test {  

    public static void main(String[] args) {  
        Provider provider = new SendMailFactory();  
        Sender sender = provider.produce();  
        sender.Send();  
    }  
}  

```

总结：如果要新增发送微信，则只需做一个实现类，实现Sender接口，同时做一个工厂类，实现Provider接口，就OK了，无需去改动现成的代码。这样做，拓展性较好！
所有工厂模式中，抽象工厂模式最先进。

### 策略模式及与工厂模式的区别

定义与使用场合：一个系统需要动态地在几种类似的算法中选择一种。
与工厂模式异同：实例化一个对象的位置不同。对工厂模式而言，实例化对象是放在了工厂类里面。而策略模式实例化对象的操作在调用的地方。本质都是继承与多态。
例子： 现有 加/减/乘 几种算法，输入参数返回值都一样（可以理解成类似的算法）。现在需要在调用时动态配置算法策略，实现对不同算法的调用。

```java
public interface Strategy {
   public int doOperation(int num1, int num2);
}
public class OperationAdd implements Strategy{
   @Override
   public int doOperation(int num1, int num2) {
      return num1 + num2;
   }
}
public class OperationSubstract implements Strategy{
   @Override
   public int doOperation(int num1, int num2) {
      return num1 - num2;
   }
}
public class OperationMultiply implements Strategy{
   @Override
   public int doOperation(int num1, int num2) {
      return num1  num2;
   }
}
public class Context {
   private Strategy strategy;

   public Context(Strategy strategy){
      this.strategy = strategy;
   }

   public int executeStrategy(int num1, int num2){
      return strategy.doOperation(num1, num2);
   }
}
public class StrategyPatternDemo {
   public static void main(String[] args) {
       //实例化对象的位置在调用处
      Context context = new Context(new OperationAdd());        
      System.out.println("10 + 5 = " + context.executeStrategy(10, 5));

      context = new Context(new OperationSubstract());        
      System.out.println("10 - 5 = " + context.executeStrategy(10, 5));

      context = new Context(new OperationMultiply());        
      System.out.println("10  5 = " + context.executeStrategy(10, 5));
   }
}

```

### 单例模式

定义及使用场合：只有一个对象被创建。
例子：
建议采用 饿汉式 创建方法。线程安全，容易实现。初始化慢一点。

```java
public class SingleObject {

   //创建 SingleObject 的一个对象
   private static SingleObject instance = new SingleObject();

   //让构造函数为 private，这样该类就不会被实例化
   private SingleObject(){}

   //获取唯一可用的对象
   public static SingleObject getInstance(){
      return instance;
   }

}
```

### 观察者模式

定义与使用场景：一个对象(subject)被其他多个对象(observer)所依赖。则当一个对象变化时，发出通知，其它依赖该对象的对象都会收到通知，并且随着变化。
比如 声音报警器和闪光灯报警器分别订阅热水器温度，热水器温度过高时，发出通知，两个报警器分别发声、闪光以实现报警。
又比如很多人订阅[微信公众号](https://www.baidu.com/s?wd=微信公众号&tn=24004469_oem_dg&rsv_dl=gh_pl_sl_csd)，该公众号有更新文章时，自动通知每个订阅的用户。
实现：1,多个观察者要订阅这个对象 2，这个对象要发出通知

例子：

```java
public interface Observer {  
    public void update();  
}  
public class Observer1 implements Observer {  

    @Override  
    public void update() {  
        System.out.println("observer1 has received!");  
    }  
}  
public class Observer2 implements Observer {  

    @Override  
    public void update() {  
        System.out.println("observer2 has received!");  
    }  

}  
public interface Subject {  

    /增加观察者/  
    public void add(Observer observer);  

    /删除观察者/  
    public void del(Observer observer);  

    /通知所有的观察者/  
    public void notifyObservers();  

    /自身的操作/  
    public void operation();  
}  
public abstract class AbstractSubject implements Subject {  

    private Vector<Observer> vector = new Vector<Observer>();  
    @Override  
    public void add(Observer observer) {  
        vector.add(observer);  
    }  

    @Override  
    public void del(Observer observer) {  
        vector.remove(observer);  
    }  

    @Override  
    public void notifyObservers() {  
        Enumeration<Observer> enumo = vector.elements();  
        while(enumo.hasMoreElements()){  
            enumo.nextElement().update();  
        }  
    }  

public class MySubject extends AbstractSubject {  

    @Override  
    public void operation() {  
        System.out.println("update self!");  
        notifyObservers();  
    }  

}  
public class ObserverTest {  

    public static void main(String[] args) {  
        Subject sub = new MySubject();  
        sub.add(new Observer1());  //订阅这个对象
        sub.add(new Observer2());  

        sub.operation();  //发出改变的一个通知
    }  

}  
```

### 代理模式

定义与使用场景：一个代理类代表一个真实类的功能，通过访问代理类来实现对真实类的访问。
比如[买火车票](https://www.baidu.com/s?wd=买火车票&tn=24004469_oem_dg&rsv_dl=gh_pl_sl_csd)这件小事：黄牛相当于是火车站的代理，我们可以通过黄牛买票，但只能去火车站进行改签和退票。
又比如需要对原有的方法进行修改，就是采用一个代理类调用原有的方法，以避免修改原有代码。
例子：
一个真实对象realSubject提供一个代理对象proxy。通过proxy可以调用realSubject的部分功能\\，并添加一些额外的业务处理，同时可以屏蔽realSubject中未开放的接口。
1、RealSubject 是委托类，Proxy 是代理类；
2、Subject 是委托类和代理类的接口；
3、request() 是委托类和代理类的共同方法；

```java
interface Subject {
    void request();
}

class RealSubject implements Subject {
    public void request(){
        System.out.println("RealSubject");
    }
}

class Proxy implements Subject {
    private Subject subject;

    public Proxy(Subject subject){
        this.subject = subject;
    }
    public void request(){
        System.out.println("begin");
        subject.request();
        System.out.println("end");
    }
}

public class ProxyTest {
    public static void main(String args[]) {
        RealSubject subject = new RealSubject();
        Proxy p = new Proxy(subject);
        p.request();
    }
}

```

### 桥接模式及与策略模式的区别

定义与使用场景：访问多种数据库驱动（多个具有共同特征的数据库驱动），不是直接访问，而是通过[DriverManager](https://www.baidu.com/s?wd=DriverManager&tn=24004469_oem_dg&rsv_dl=gh_pl_sl_csd)桥来访问。

与策略模式的区别：(个人觉得较复杂，了解即可。本质都是面向接口编程，体现继承与多态)
策略模式：我要画圆，要实心圆，我可以用solidPen来配置，画虚线圆可以用dashedPen来配置。这是strategy模式。
桥接模式：同样是画圆，我是在windows下来画实心圆，就用windowPen+solidPen来配置，在unix下画实心圆就用unixPen+solidPen来配置。如果要再windows下画虚线圆，就用windowsPen+dashedPen来配置，要在unix下画虚线圆，就用unixPen+dashedPen来配置。
所以相对策略模式，桥接模式要表达的内容要更多，结构也更加复杂。

### 外观模式

定义与使用场景：见例子。又比如，去医院看病，可能要去挂号、门诊、划价、取药，让患者或患者家属觉得很复杂，如果有提供接待人员，只让接待人员来处理，就很方便。
例子：计算机启动，需要先启动CPU，再启动memory，最后启动disk。这三个类之间具有先后关系（依赖关系）。
与工厂模式的区别：工程模式多个类具有共同特征（继承一个共同的接口），是并列的。而外观模式多个类是有先后关系，是串行的，用组合。

贴部分代码：

```java
public class Computer {  
//是组合，而非继承。这是与工程模式的显著区别。
    private CPU cpu;  
    private Memory memory;  
    private Disk disk;  

    public Computer(){  
        cpu = new CPU();  
        memory = new Memory();  
        disk = new Disk();  
    }  

    public void startup(){  
        System.out.println("start the computer!");  
        cpu.startup();  
        memory.startup();  
        disk.startup();  
        System.out.println("start computer finished!");  
    }  

    public void shutdown(){  
        System.out.println("begin to close the computer!");  
        cpu.shutdown();  
        memory.shutdown();  
        disk.shutdown();  
        System.out.println("computer closed!");  
    }  
}  
public class User {  

    public static void main(String[] args) {  
        Computer computer = new Computer();  
        //将计算机的启动过程封装成一个类
        computer.startup();  
        computer.shutdown();  
    }  
}  

```

### 生产者-消费者模式

定义与使用场景：生产者把数据放入缓冲区，而消费者从缓冲区取出数据。
例子：缓冲区一般为队列（FIFO），但在生产消费较为频繁时，队列push，pop内存消耗较大，此时可以考虑环形缓冲区（以数组、链表方式实现）。
通过互斥锁防止缓冲区同时读写。通过信号量控制缓冲区大小（满的时候不允许写，空的时候不允许读）