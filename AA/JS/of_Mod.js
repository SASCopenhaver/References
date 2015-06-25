// JavaScript Document
//Created 1997 by Brian Risk.  http://members.aol.com/brianrisk
function of_Mod(argDivisee, argBase)
{
	return Math.round(argDivisee - (Math.floor(argDivisee/argBase)*argBase));
}
