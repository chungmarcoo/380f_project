package ouhk.comps380f.model;

import java.util.List;
import java.util.Collection;
import java.util.Hashtable;
import java.util.Map;

public class Item {

    private long id;
    private String customerName;
    private String subject;
    private String expectedPrice;
    private String status;
    private int noOfBids = 0;
    private int numberOfComments = 0;
    private String description;
    private Map<String, Attachment> attachments = new Hashtable<>();
    private Map<String, BidPrice> bidPrices = new Hashtable<>();
    private Map<String, Comment> comments = new Hashtable<>();   
    private String winnerName;
    private String winnerPrice;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getExpectedPrice(){
        return expectedPrice;
    }
    
    public void setExpectedPrice(String expectedPrice){
        this.expectedPrice=expectedPrice;
    }
    
    public String getStatus(){
        return status;
    }
    
    public void setStatus(String status){
        this.status=status;
    }
    
    public int getNoOfBids(){
        return this.bidPrices.size();
    }
    
    public void setNoOfBids(int noOfBids){
        this.noOfBids=noOfBids;
    }
    
    public String getDescription(){
        return description;
    }
    
    public void setDescription(String description){
        this.description=description;
    }

    public Attachment getAttachment(String name) {
        return this.attachments.get(name);
    }

    public Collection<Attachment> getAttachments() {
        return this.attachments.values();
    }

    public void addAttachment(Attachment attachment) {
        this.attachments.put(attachment.getName(), attachment);
    }

    public int getNumberOfAttachments() {
        return this.attachments.size();
    }
        
    public boolean hasAttachment(String name) {
        return this.attachments.containsKey(name);
    }

    public Attachment deleteAttachment(String name) {
        return this.attachments.remove(name);
    }   

    public Map getBidPrices(String bidder){
        return this.bidPrices;
    }
    
    public Collection<BidPrice> getBidPrice(){
        return this.bidPrices.values();
    }
    
    public int getNumberOfBidPrices() {
        return this.bidPrices.size();
    }
    
    public void addBidPrices(BidPrice bidPrice){
        this.bidPrices.put(bidPrice.getBidder(),bidPrice);
    }
    
    public boolean hasBidPrices(String bidder){
        return this.bidPrices.containsKey(bidder);
    }
    
    public BidPrice deleteBidPrice(String bidder){
        return this.bidPrices.remove(bidder);
    }

    public String getWinnerName() {
        return winnerName;
    }

    public void setWinnerName(String winnerName) {
        this.winnerName = winnerName;
    }

    public String getWinnerPrice() {
        return winnerPrice;
    }

    public void setWinnerPrice(String winnerPrice) {
        this.winnerPrice = winnerPrice;
    }
    
    public boolean checkHasBidded(String username){
        try{
            BidPrice b= this.bidPrices.get(username);
            System.out.println(b.getBidder());
            return true;
        }catch(Exception e){
            return false;
        }
    }
    
    public Comment getComment(String name) {
        return this.comments.get(name);
    }

    public Collection<Comment> getComments() {
        return this.comments.values();
    }

    public void addComment(Comment comment) {
        this.comments.put(comment.getName(), comment);
    }

    public int getNumberOfComments() {
        return this.attachments.size();
    }
        
    public boolean hasComment(String name) {
        return this.comments.containsKey(name);
    }

    public Comment deleteComment(String name) {
        return this.comments.remove(name);
    }

    public BidPrice getBidPrice(String username){
        try{
            BidPrice b= this.bidPrices.get(username);
            return b;
        }catch(Exception e){
            return null;
        }
    }
}