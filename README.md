# Vectors
Learning about vectors and matrices through programming

![](https://cdn.discordapp.com/attachments/814903405721681941/814903415742136430/cln2CuHs8nLgSIH9LtfRfCjxhNLjDsBmISkUqwsxnnWrH45IfXPPUo8AAAAAElFTkSuQmCC.png)

# What I learned
 - Unit vectors
 - Linear combinations
 - Linear dependancy
 - Subspaces
 - Dot & Cross products

# How I learned
I learned by spending my spare time at home researching new ideas that I found interesting. <br/>
Eventually I came upon vectors and matrices and found them really interesting, although I didn't complete understand them. <br/>
I decided to begin learning them with the guidance of the resources below and some long moments of hard thinking from myself.

 - [KhanAcademy Linear Algebra](https://www.khanacademy.org/math/linear-algebra/)

# Documentation
<h2>Visual</h2>

**\<void\> vector3:toggleAxis()**
<br/>
*Shows or hides an axis from (0, 0, 0) going 2048 studs on the X, Y, and Z axis.*

**\<Instance\> vector3:visualise(\<Vector3\> Vector, \<table\> Options \[\<Vector3\> origin, \<Enum\> material, \<BrickColor\> colour, \<number\> guiRange\])**
<br/>
*Plots supplied vectors in the workspace along with a gui containing the vital information about the vector and returns the part.*

**\<tuple\> vector3:plot(\<Vector3\> Vector, \<Vector3\> Vector, ...)**
<br/>
*Plots supplied vectors as positions in the workspace and returns the parts in a tuple.*

**\<Instance\> vector3:attachVectors(\<Vector3\> Origin, \<Vector3\> Target)**
<br/>
*Attaches two vectors via a part that is returned.*

<h2>Utility</h2>

**\<boolean\> vector3:compareVectors(\<Vector3\> Vector, \<Vector3\> Vector)**
<br/>
*Compares two vectors and returns if they are equal. This is to avoid floating point errors from ROBLOX, as comparing Vector3's directly will often result in
an inaccurate evaluation.*

**\<boolean\> vector3:isParallel(\<Vector3\> Vector, \<Vector3\> Vector)**
<br/>
*Compares the units of supplied vectors to find if they are parallel.*

**\<boolean\> vector3:isPerpindicular(\<Vector3\> Vector, \<Vector3\> Vector)**
<br/>
*WIP*

**\<void\> vector3:roundNum(\<number\> Number, <number?> Decimal places)**
<br/>
*Rounds the supplied number to a default of two decimal places.*

**\<void\> vector3:round(\<Vector3\> Vector, <number?> Decimal places)**
<br/>
*Rounds the supplied Vector3 to a default of two decimal places per component.*
