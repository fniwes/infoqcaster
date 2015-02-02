<!DOCTYPE html>
<html>
	<head>
		<title>Presentation</title>
		<meta name="layout" content="main"/>

		<script type="text/javascript" src="https://www.gstatic.com/cv/js/sender/v1/cast_sender.js"></script>
	</head>
	<body>

		<h1><span id="casticon" style="display: none">Start casting!</span></h1>
		<h1>Current Slide</h1>
		<img id="slide" height="250px" />

		<script>

		// Class to control video playback over Chromecast
		var ChromecastVideoPlayer = function( deviceStateCallback ) {
			this.available = false;
			this.currentMedia = undefined;
			this.currentTime = 0;
			this.playStateCallback = undefined;
			this.deviceStateCallback = deviceStateCallback;
			this.videoSource = "";

			this._initCastApi();
		};

		ChromecastVideoPlayer.prototype._log = function(prefix) { 
			return function() {
				console.log(prefix, arguments);
			}
		};

		ChromecastVideoPlayer.prototype._initCastApi = function() {
			var sessionRequest = new chrome.cast.SessionRequest(chrome.cast.media.DEFAULT_MEDIA_RECEIVER_APP_ID);
			var apiConfig = new chrome.cast.ApiConfig(
				sessionRequest,
				this._sessionListener.bind(this), 
				this._receiverListener.bind(this)
			);

			chrome.cast.initialize(apiConfig, this._log("Init Success"), this._log("Init Error"));
		};

		ChromecastVideoPlayer.prototype._sessionListener = function(session) {
			console.log("Session Listener Callback", session);
		};

		ChromecastVideoPlayer.prototype._receiverListener = function(e) {
			if( e === chrome.cast.ReceiverAvailability.AVAILABLE) {
				this.available = true;
				this.deviceStateCallback.call(this);
			}
		};

		ChromecastVideoPlayer.prototype._requestSessionSuccess = function(resolve, reject, session) {
			var player = this;

			var mediaInfo = new chrome.cast.media.MediaInfo(this.videoSource);
			mediaInfo.contentType = 'video/mp4';
			var request = new chrome.cast.media.LoadRequest(mediaInfo);

			session.loadMedia(request, function(media) {
				player.currentMedia = media;
				player.currentTime = 0;
				resolve(session, media)
			}, function() { reject("Media Load error") });
		};

		ChromecastVideoPlayer.prototype._startPlaying = function() {
			var updateTiming =  (function() {
				this.currentTime = this.currentTime + 1;
				this.playStateCallback(this);

				setTimeout(updateTiming, 1000);
			}).bind(this);

			setTimeout(updateTiming, 1000);
		};

		ChromecastVideoPlayer.prototype.isAvailable = function() { return this.available };
		ChromecastVideoPlayer.prototype.load = function(str) {
			var player = this;
			player.videoSource = str;

			var promise = new Promise(function(resolve, reject) {
				chrome.cast.requestSession(
					player._requestSessionSuccess.bind(player, resolve, reject), 
					function() { reject("Request session error") }
				);
			});

			return promise;
		};

		ChromecastVideoPlayer.prototype.play = function(callback) {
			this.playStateCallback = callback;
			this.currentMedia.play(null, this._startPlaying.bind(this), this._log("Play error"));
		};

		/**
		 * Function that is called when chromecast status change.
		 * @this ChromecastVideoPlayer
		 */
		function deviceStateCallback(status) {
			if( this.isAvailable() ) {
				var player = this;
				var element = document.getElementById("casticon");
				element.addEventListener("click", function() { 
					var src = "http://d1snlc0orfrhj.cloudfront.net/presentations/14-sep-grails3point0preview-2.mp4";
					player
						.load(src)
						.then( function() { player.play( updateSlide ) } )
						.catch( player._log("Load error") );
				});
				element.style.color = "red";
				element.style.display = "inline";
			}
		}









		

		function updateSlide(player) {
			var slides = new Array('/resource/presentations/grails-3-preview/en/slides/sl1.jpg','/resource/presentations/grails-3-preview/en/slides/sl2.jpg','/resource/presentations/grails-3-preview/en/slides/sl3.jpg','/resource/presentations/grails-3-preview/en/slides/sl4.jpg','/resource/presentations/grails-3-preview/en/slides/sl5.jpg','/resource/presentations/grails-3-preview/en/slides/sl6.jpg','/resource/presentations/grails-3-preview/en/slides/sl7.jpg','/resource/presentations/grails-3-preview/en/slides/sl8.jpg','/resource/presentations/grails-3-preview/en/slides/sl9.jpg','/resource/presentations/grails-3-preview/en/slides/sl10.jpg','/resource/presentations/grails-3-preview/en/slides/sl11.jpg','/resource/presentations/grails-3-preview/en/slides/sl12.jpg','/resource/presentations/grails-3-preview/en/slides/sl13.jpg','/resource/presentations/grails-3-preview/en/slides/sl14.jpg','/resource/presentations/grails-3-preview/en/slides/sl15.jpg','/resource/presentations/grails-3-preview/en/slides/sl16.jpg','/resource/presentations/grails-3-preview/en/slides/sl17.jpg','/resource/presentations/grails-3-preview/en/slides/sl18.jpg','/resource/presentations/grails-3-preview/en/slides/sl19.jpg','/resource/presentations/grails-3-preview/en/slides/sl20.jpg','/resource/presentations/grails-3-preview/en/slides/sl21.jpg','/resource/presentations/grails-3-preview/en/slides/sl22.jpg','/resource/presentations/grails-3-preview/en/slides/sl23.jpg','/resource/presentations/grails-3-preview/en/slides/sl24.jpg','/resource/presentations/grails-3-preview/en/slides/sl25.jpg','/resource/presentations/grails-3-preview/en/slides/sl26.jpg','/resource/presentations/grails-3-preview/en/slides/sl27.jpg','/resource/presentations/grails-3-preview/en/slides/sl28.jpg','/resource/presentations/grails-3-preview/en/slides/sl29.jpg','/resource/presentations/grails-3-preview/en/slides/sl30.jpg','/resource/presentations/grails-3-preview/en/slides/sl31.jpg','/resource/presentations/grails-3-preview/en/slides/sl32.jpg','/resource/presentations/grails-3-preview/en/slides/sl33.jpg','/resource/presentations/grails-3-preview/en/slides/sl34.jpg','/resource/presentations/grails-3-preview/en/slides/sl35.jpg','/resource/presentations/grails-3-preview/en/slides/sl36.jpg','/resource/presentations/grails-3-preview/en/slides/sl37.jpg','/resource/presentations/grails-3-preview/en/slides/sl38.jpg','/resource/presentations/grails-3-preview/en/slides/sl39.jpg','/resource/presentations/grails-3-preview/en/slides/sl40.jpg','/resource/presentations/grails-3-preview/en/slides/sl39.jpg','/resource/presentations/grails-3-preview/en/slides/sl41.jpg','/resource/presentations/grails-3-preview/en/slides/sl42.jpg','/resource/presentations/grails-3-preview/en/slides/sl43.jpg','/resource/presentations/grails-3-preview/en/slides/sl44.jpg','/resource/presentations/grails-3-preview/en/slides/sl45.jpg','/resource/presentations/grails-3-preview/en/slides/sl46.jpg','/resource/presentations/grails-3-preview/en/slides/sl47.jpg','/resource/presentations/grails-3-preview/en/slides/sl48.jpg');
            var times = new Array(0,42,61,93,135,190,267,352,469,548,616,687,785,867,961,1019,1088,1115,1310,1450,1574,1592,1627,1702,1807,1847,1885,1968,2086,2189,2209,2881,2916,3006,3362,3363,3481,3501,3651,3681,3694,3797,3886,3976,4130,4239,4304,4401,4857,5491);

			var currentTime = player.currentTime;
			var currentSlideTime = times.reduce( greaterSmallerThan(currentTime) );
			var currentSlideIndex = times.indexOf(currentSlideTime);

			var slideBase = "http://www.infoq.com";
			document.getElementById("slide").src = slideBase + slides[currentSlideIndex];
		}

		function greaterSmallerThan( target ) {
			return function(previous, current, index, array) {
				if(current < target) return current;
				return previous;
			}
		}






		window['__onGCastApiAvailable'] = function(loaded, errorInfo) {
			if (loaded) {
				var player = new ChromecastVideoPlayer( deviceStateCallback );
			}
		}
		</script>
	</body>
</html>