

So what you were saying last night was to move everything into one State object, like isLoading. 
Going that route I still have something I don't understand.  With my current understanding, I would have
to create a new PostModel for the entire page, include the loading as false, and each of the row one and two values
just to update part of the UI.

So I would be doing things like:
https://github.com/spencercope/flutter_testing/blob/c6a39035774018b10f510b3c73338af6ab8ba908/lib/main.dart#L99

Which doesn't seem like the right way to do things.  What are you thoughts here, do I
need more specific State objects? 
