#Positive and Negative Edges in E2 Gmod
#Version v1.0
#Last updated: 2024/03/09
#By EderAlaves


@name Edges
@inputs Button1 Button2 Reset
@outputs PECounter NECounter Text1:string Text2:string OUT OUT2
@persist Diff1 Diff2 LastButton1 LastButton2
@trigger none
@strict
interval(20)

#To test it, we will have two inputs and two counters, one for Positive Edges and other for Negative Edges

#---------------POSITIVE EDGE DETECTION---------------
#Button1 makes PECounter to rise when a Possitive Edge is detected
#To detect a Positive Edge of Button1 we have to compare with the last value
Diff1 = Button1 - LastButton1

#If the difference is 1 means a possitive edge
if(Diff1 == +1){
    PECounter = PECounter + 1
}
Text1 = toString(PECounter)
LastButton1 = Button1
#-----------------------------------------------------


#---------------NEGATIVE EDGE DETECTION---------------
#Now we do the same as Button1, but the difference must be -1 for a Negative Edge
Diff2 = Button2 - LastButton2

if(Diff2 == -1){
    NECounter = NECounter + 1
}
Text2 = toString(NECounter)
LastButton2 = Button2
#-----------------------------------------------------

#-----------------------RESET-------------------------
#Reset to restart the counters
if(Reset == 1) {
    PECounter = 0
    NECounter = 0
}
#-----------------------------------------------------

#To use then easier here you have two functions posEdge() and negEdge() to use in your program
#I've make this part with changes() function, which returns a '1' if variable inside it changes
#Maybe the pulse is very fast

#---------------POSITIVE EDGE FUNCTION---------------
#Returs 1 when Positive Edge is detected
function number posEdge(Input:number) {
if (changed(Input) == 1){
        if((Input) == 1){
            return 1
        }
        else {
            return 0    
        }
}
else {
return 0    
}
}
#-----------------------------------------------------

#---------------NEGATIVE EDGE FUNCTION---------------
#Returs 1 when Negative Edge is detected
function number negEdge(Input:number) {
if (changed(Input) == 1){
        if((Input) == 0){
            return 1
        }
        else {
            return 0    
        }
}
else {
return 0    
}
}
#-----------------------------------------------------

#There's another option that I haven't tried to and it's using
#the "$" symbol before a variable to calculate the change of that variable since the last execution.
