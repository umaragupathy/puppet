node default {
	
}

node "precise64.amp.com.au" {
	include localusers
	include localusers::groups::wheel
	include localusers::groups::finance
	include base
	include base::ssh
	notify {'This is a test notify':}
}
