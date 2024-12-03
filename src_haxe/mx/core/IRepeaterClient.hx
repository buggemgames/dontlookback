package mx.core;


interface IRepeaterClient
{
    
    
    
    var instanceIndices(get, set) : Array<Dynamic>;    
    
    var isDocument(get, never) : Bool;    
    
    
    
    var repeaters(get, set) : Array<Dynamic>;    
    
    
    
    var repeaterIndices(get, set) : Array<Dynamic>;

    
    function initializeRepeaterArrays(param1 : IRepeaterClient) : Void
    ;
}


