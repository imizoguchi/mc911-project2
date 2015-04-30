package llvmast;
public  class LlvmBranch extends LlvmInstruction{
	
	public LlvmLabelValue brTrue = null; 
    public LlvmLabelValue brFalse = null;
    public LlvmValue cond = null;

    public LlvmBranch(LlvmLabelValue label){
    	this.brTrue = label;
    }
    
    public LlvmBranch(LlvmValue cond,  LlvmLabelValue brTrue, LlvmLabelValue brFalse){
    	this.cond = cond;
       	this.brTrue = brTrue;
       	this.brFalse = brFalse;
    }

    /*
     * returns syntax:
     * br i1 <cond>, label <iftrue>, label <iffalse>
	 * br label <dest>          ; Unconditional branch
     * @see java.lang.Object#toString()
     */
    public String toString(){
    	
    	// Unconditional Branch
		if(cond == null && brTrue != null) {
			return "  " + "br label %" + brTrue;
			
		// Conditional Branch
		} else {
			return "  " + "br i1 " + cond + ", label %" + brTrue + ", label %" + brFalse;
		}
    }
}