<?php

namespace App\Controller;

use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;

use App\Entity\Event;
use App\Entity\Status;

class EventsController extends AbstractController
{
    /**
     * @Route("/", name="event")
     */
    public function index(): Response
    {
            $events = $this->getDoctrine()->getRepository('App:Event')->findAll();
       return $this->render('events/index.html.twig', array('events'=>$events));
    }




    /**
     * @Route("/create", name="event_create")
     */
    public function create(Request $request): Response
    {
      // Here we create an object from the class that we made
        $events = new Event;
        /* Here we will build a form using createFormBuilder and inside this function we will put our object and then we write add then we select the input type then an array to add an attribute that we want in our input field */
        $form = $this->createFormBuilder($events)
        ->add('name', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:20px')))
        ->add('date_and_start', DateTimeType::class, array('attr' => array('style'=>'margin-bottom:20px')))
        ->add('description', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:20px')))
        ->add('img', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:20px')))
        ->add('capacity', IntegerType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:20px')))
        ->add('email', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:20px')))
        ->add('phone_num', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:20px')))
        ->add('address', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:20px')))
        ->add('url', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:20px')))
        ->add('more_desc', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:20px')))
        ->add('save', SubmitType::class, array('label'=> 'Create Event', 'attr' => array('class'=> 'btn btn-success mt-4')))
        ->getForm();
        $form->handleRequest($request);
       
        /* Here we have an if statement, if we click submit and if  the form is valid we will take the values from the form and we will save them in the new variables */
        if($form->isSubmitted() && $form->isValid()){
            //fetching data
            // taking the data from the inputs by the name of the inputs then getData() function
            $name = $form['name']->getData();
            $date_and_start = $form['date_and_start']->getData();
            $description = $form['description']->getData();
            $img = $form['img']->getData();
            $capacity = $form['capacity']->getData();
            $email = $form['email']->getData();
            $phone_num = $form['phone_num']->getData();
            $address = $form['address']->getData();
            $url = $form['url']->getData();
            $more_desc = $form['more_desc']->getData();
/* these functions we bring from our entities, every column have a set function and we put the value that we get from the form */
            $events->setName($name);
            $events->setDateAndStart($date_and_start);
            $events->setDescription($description);
            $events->setImg($img);
            $events->setCapacity($capacity);
            $events->setEmail($email);
            $events->setPhoneNum($phone_num);
            $events->setAddress($address);
            $events->setUrl($url);
            $events->setMoreDesc($more_desc);
            $em = $this->getDoctrine()->getManager();
            $em->persist($events);
            $em->flush();
            $this->addFlash(
                    'notice',
                    'Event Added'
                    );
            return $this->redirectToRoute('event');
        }
 /* now to make the form we will add this line form->createView() and now you can see the form in create.html.twig file  */
        return $this->render('events/create.html.twig', array('form' => $form->createView()));
    
    }


    /**
     * @Route("/edit/{id}", name="event_edit")
     */
    public function edit(Request $request, $id): Response
    {
     /* Here we have a variable event and it will save the result of this search and it will be one result because we search based on a specific id */
       $events = $this->getDoctrine()->getRepository('App:Event')->find($id);
   /* Now we will use set functions and inside this set functions we will bring the value that is already exist using get function for example we have setName() and inside it we will bring the current value and use it again */
            $events->setName($events->getName());
            $events->setDateAndStart($events->getDateAndStart());
            $events->setDescription($events->getDescription());
            $events->setImg($events->getImg());
            $events->setCapacity($events->getCapacity());
            $events->setEmail($events->getEmail());
            $events->setPhoneNum($events->getPhoneNum());
            $events->setAddress($events->getAddress());
            $events->setUrl($events->getUrl());
            $events->setMoreDesc($events->getMoreDesc());
   /* Now when you type createFormBuilder and you will put the variable animal the form will be filled of the data that you already set it */
        $form = $this->createFormBuilder($events)
        ->add('name', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:20px')))
        ->add('date_and_start', DateTimeType::class, array('attr' => array('style'=>'margin-bottom:20px')))
        ->add('description', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:20px')))
        ->add('img', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:20px')))
        ->add('capacity', IntegerType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:20px')))
        ->add('email', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:20px')))
        ->add('phone_num', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:20px')))
        ->add('address', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:20px')))
        ->add('url', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:20px')))
        ->add('more_desc', TextType::class, array('attr' => array('class'=> 'form-control', 'style'=>'margin-bottom:20px')))
        ->add('save', SubmitType::class, array('label'=> 'Create Event', 'attr' => array('class'=> 'btn btn-success mt-4')))
        ->getForm();
       $form->handleRequest($request);

       if($form->isSubmitted() && $form->isValid()){
           //fetching data
            $name = $form['name']->getData();
            $date_and_start = $form['date_and_start']->getData();
            $description = $form['description']->getData();
            $img = $form['img']->getData();
            $capacity = $form['capacity']->getData();
            $email = $form['email']->getData();
            $phone_num = $form['phone_num']->getData();
            $address = $form['address']->getData();
            $url = $form['url']->getData();
            $more_desc = $form['more_desc']->getData();
            $em = $this->getDoctrine()->getManager();
            $events = $em->getRepository('App:Event')->find($id);
            $events->setName($name);
            $events->setDateAndStart($date_and_start);
            $events->setDescription($description);
            $events->setImg($img);
            $events->setCapacity($capacity);
            $events->setEmail($email);
            $events->setPhoneNum($phone_num);
            $events->setAddress($address);
            $events->setUrl($url);
            $events->setMoreDesc($more_desc);
           
           $em->flush();
           $this->addFlash(
                   'notice',
                   'Event Updated'
                   );
           return $this->redirectToRoute('event');
       }
       return $this->render('events/edit.html.twig', array('event' => $events, 'form' => $form->createView()));      }




    /**
     * @Route("/details/{id}", name="event_details")
     */
    public function details($id): Response
    {
        $events = $this->getDoctrine()->getRepository('App:Event')->find($id);
        return $this->render('events/details.html.twig', array('events' => $events));
    }



    /**
     * @Route("/delete/{id}", name="event_delete")
     */
    public function delete($id){
        $em = $this->getDoctrine()->getManager();
        $events = $em->getRepository('App:Event')->find($id);
        $em->remove($events);
       
        $em->flush();
        $this->addFlash(
            'notice',
            'Event Removed'
        );
       
        return $this->redirectToRoute('event');
    }

} 
    