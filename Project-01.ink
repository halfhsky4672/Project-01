/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR time = -1 //  0 8:00 AM, 1 10:00 AM, 2 2:00 PM, 3 6:00 PM, 4 12:00 AM
VAR your_name = ""



-> begin

=== begin ===
Please say your name traveler.
* [Elvis]
~ your_name = "Elvis"
Thank you very much...
-> begin2
* [Employee]
~ your_name = "Employee"
You will be a great asset to the company...
->begin2
* [William]
~ your_name = "William"
You came back?
-> begin2
* [Megan]
~ your_name = "Megan"
Welcome Megan...
-> begin2
* [your name]
~ your_name = "your name"
You really thought I was gonna say something like "ha ha very funny" and then not let you choose it? Well you made your choice. Enjoy being called "your name" for the rest of your life!
-> begin2
-> END

=== begin2 ===
A young explorer named {your_name} is in search of their greatest treasure yet, the diamond trident. They are currently in a vast jungle. In front of them is a pit of quicksand with various rocks scattered in it that lead across. What do {your_name} do?
It is { advance_time () }
+ [Swing over the sand via a vine]
You mange to swing over the quicksand.
-> other_side
+ [Jump on rocks]
One of the rocks gives way and {your_name} falls into the quicksand.
-> too_bad
+ [Wait]
{your_name} dies of starvation.
-> too_bad
+ [Walk around the sand]
Well that was easy.
-> other_side
-> END

=== too_bad ===
You cannot give up just yet...
{your_name}! Stay determined!
[Go back] -> begin2
-> END

=== other_side ===
Once {your_name} gets across they come across an ogre shouting at them to get out of his Swamp.
It is { advance_time () }
+ [fight the ogre]
{your_name} dies...
-> too_bad
+ [correct the ogre]
{your_name} informs the ogre that he is living in a jungle. The ogre comes to realization that his life is a lie and runs away crying.
-> past_ogre
+ [ask the ogre to watch "shrek" with you]
He hates that movie.
-> too_bad
+ [be polite]
{your_name} politely asks the ogre if they may pass through. The ogre is awstruck by such kind words and allows {your_name} to pass.
-> past_ogre

=== past_ogre ===
{your_name} has finaly reached the temple that is set to house the dimond trident but once they enter there is a fork in the path.
It is { advance_time () }
+ [Go left] -> left_corridor
+ [Go right] -> right_corridor
-> END

=== left_corridor ===
{your_name} is now in the left corridor. In front of them are three doors each with an enscription on them. 
It is { advance_time () }
+ [read the left door enscription]
It reads, "I always speak the truth. In order to proceed, you must enter either me or the right door. Be carful, as the middle door is a liar."
-> left_corridor
+ [read the middle door enscription]
It reads, "I am a liar. In order to proceed, listen to the other doors."
-> left_corridor
+ [read the right door enscription]
It reads, "I always speak the truth. In order to proceed, you must enter either me or the left door. Be carful, as the middle door is a liar."
-> left_corridor
+ [enter the left door]
As they enter the left door, {your_name} plumits into a bed of spikes.
-> too_bad
+ [enter the middle door]
As they open the middle door, {your_name} walks into the trident room.
-> trident_room
+ [enter the right door]
As they enter the right door, {your_name} plumits into a pit of scoldering magma.
-> too_bad
-> END

=== right_corridor ===
{your_name} is now in the right corridor. In front of them is a bed of spikes leading to a doorway.
It is { advance_time () }
+ [jump over the spikes]
As they jump over the spikes, {your_name} pauses in mid air in a cartoonish fashion realizing that they can't jump that far before plumiting into the spikes below.
-> too_bad
+ [Crawl on the spikes]
As they begin crawling, {your_name} realizes that when they spread their full body wieght onto the spikes their skin miraculously doesn't get pierced.
-> trident_room
+ [wall jump over the spikes]
This isn't like a video game. Or is it? Either way {your_name} dies.
->too_bad
+ [wait]
{your_name} waits for what seems like days and...wait...what? The spikes grow cartoonish eyes and look around? The spikes then assume that who ever was supposed to go through this level must be gone by now so they leave.
-> trident_room
-> END

=== trident_room ===
{your_name} is nearly about to have the dimond trident within their grasps when they begin to read the text below it. It reads, "If you pull this trident from its tomb you will gain cosmic powers beond comprehension but there is a price to pay for that power."
It is { advance_time () }
+ [pull the trident] -> bad_ending
+ [do not] -> good_ending
-> END

=== bad_ending ===
As {your_name} pulls the trident from the vessel, the world slowly begins collapsing into a black hole. As {your_name} wanders through an endless void they begin to see that their power means nothing without anything to have power over.
[Congrats! You...well whatever you are...have completed the "Bad Ending".]
-> END

=== good_ending ===
After they leave the temple, {your_name} lives a long life of happiness but a part of themselves still wanders how things might have worked out if they would have took the trident.
[Congrats! You have completed the "Good Ending". Good on you!
-> END

-> END

== function advance_time ==

    ~ time = time + 1
    
    {
        - time > 4:
            ~ time = 0
    }    
    {    
         - time == 0:
            ~ return "8:00 AM"
            
         - time == 1:
            ~ return "10:00 AM"
            
         - time == 2:
            ~ return "2:00 PM"
            
         - time == 3:
            ~ return "6:00 PM"
            
         - time == 4:
            ~ return "12:00 AM"
    }
    
    
        
    ~ return time
    