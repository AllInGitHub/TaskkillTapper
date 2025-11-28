package backend;

import objects.MalwareTask;

typedef SwagSongData =
{
	var ?path:String;
	var name:String;
	var ?artist:String;
	var chart:Array<NoteData>;
}

typedef NoteData =
{
	var time:Float;
	var ?link:MalwareTask;
}
