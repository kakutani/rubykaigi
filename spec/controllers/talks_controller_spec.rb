require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TalksController do

  def mock_talk(stubs={})
    @mock_talk ||= mock_model(Talk, stubs)
  end
  
  describe "GET index" do

    it "exposes all talks as @talks" do
      Talk.should_receive(:find).with(:all).and_return([mock_talk])
      get :index
      assigns[:talks].should == [mock_talk]
    end

    describe "with mime type of xml" do
  
      it "renders all talks as xml" do
        Talk.should_receive(:find).with(:all).and_return(talks = mock("Array of Talks"))
        talks.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested talk as @talk" do
      Talk.should_receive(:find).with("37").and_return(mock_talk)
      get :show, :id => "37"
      assigns[:talk].should equal(mock_talk)
    end
    
    describe "with mime type of xml" do

      it "renders the requested talk as xml" do
        Talk.should_receive(:find).with("37").and_return(mock_talk)
        mock_talk.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new talk as @talk" do
      Talk.should_receive(:new).and_return(mock_talk)
      get :new
      assigns[:talk].should equal(mock_talk)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested talk as @talk" do
      Talk.should_receive(:find).with("37").and_return(mock_talk)
      get :edit, :id => "37"
      assigns[:talk].should equal(mock_talk)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created talk as @talk" do
        Talk.should_receive(:new).with({'these' => 'params'}).and_return(mock_talk(:save => true))
        post :create, :talk => {:these => 'params'}
        assigns(:talk).should equal(mock_talk)
      end

      it "redirects to the created talk" do
        Talk.stub!(:new).and_return(mock_talk(:save => true))
        post :create, :talk => {}
        response.should redirect_to(talk_url(mock_talk))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved talk as @talk" do
        Talk.stub!(:new).with({'these' => 'params'}).and_return(mock_talk(:save => false))
        post :create, :talk => {:these => 'params'}
        assigns(:talk).should equal(mock_talk)
      end

      it "re-renders the 'new' template" do
        Talk.stub!(:new).and_return(mock_talk(:save => false))
        post :create, :talk => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested talk" do
        Talk.should_receive(:find).with("37").and_return(mock_talk)
        mock_talk.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :talk => {:these => 'params'}
      end

      it "exposes the requested talk as @talk" do
        Talk.stub!(:find).and_return(mock_talk(:update_attributes => true))
        put :update, :id => "1"
        assigns(:talk).should equal(mock_talk)
      end

      it "redirects to the talk" do
        Talk.stub!(:find).and_return(mock_talk(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(talk_url(mock_talk))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested talk" do
        Talk.should_receive(:find).with("37").and_return(mock_talk)
        mock_talk.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :talk => {:these => 'params'}
      end

      it "exposes the talk as @talk" do
        Talk.stub!(:find).and_return(mock_talk(:update_attributes => false))
        put :update, :id => "1"
        assigns(:talk).should equal(mock_talk)
      end

      it "re-renders the 'edit' template" do
        Talk.stub!(:find).and_return(mock_talk(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested talk" do
      Talk.should_receive(:find).with("37").and_return(mock_talk)
      mock_talk.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the talks list" do
      Talk.stub!(:find).and_return(mock_talk(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(talks_url)
    end

  end

end
