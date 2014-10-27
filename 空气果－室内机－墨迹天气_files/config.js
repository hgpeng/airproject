(function(seajs) {
	var alias = {
		$: '3rd-lib/jquery/jquery.js',
		jquery: '3rd-lib/jquery/jquery.js',
		jquery_ui: '3rd-lib/jquery/jquery-ui.min.js',
		jGrowl: '3rd-lib/jquery/jquery.jgrowl.js',
		json: '3rd-lib/json/json.js',
		bachange: '3rd-lib/hashchange/jquery.ba-hashchange.js',
//		handlebars: 'gallery/handlebars/1.0.1/handlebars.js',
//		underscore: 'gallery/underscore/1.4.3/underscore.js',

//		base: 'src/base.js',
//		encode: 'src/encode.js',
//		random: 'src/random.js',
//		support: 'src/support.js',
//		log: 'src/debug.js',
//		hashlib: 'src/hash.js',
//		sort: 'src/sort.js',
//		win: 'src/window.js',

		// components
		cookie: '3rd-lib/other/cookie.js',
		valueChange: '3rd-lib/other/valuechange.js',
//		store: '3rd-lib/other/store.js',
		placeholder: '3rd-lib/other/placeholder.js',
        util:'common/util.js',
//		slide: 'components/slide.js',
//		overlay: 'components/overlay.js',
//		stateMachine: 'components/stateMachine.js',
//		soltMachine: 'components/soltMachine.js',
//		citySelector: 'components/citySelector.js'
        /*kindeditor*/
        kindeditor: '3rd-lib/kindeditor/kindeditor.js',
        bootstrap: '3rd-lib/bootstrap/js/bootstrap.min.js',
        //common timepicker
        datetime_extends: '3rd-lib/jQuery-Timepicker-Addon-master/dist/jquery-ui-timepicker-addon.min.js',
        page: 'common/page.js',
        grid_licious: '3rd-lib/waterfall/jquery.grid-a-licious.min.js',
        lazy_unveil: '3rd-lib/waterfall/jquery.unveil.min.js',
        date_plugin: 'common/datetime.js',
        stepy: '3rd-lib/stepy/js/jquery.stepy.min.js',
        validate: '3rd-lib/validation/jquery.validate.min.js',
        bootstrap_plugin: '3rd-lib/bootstrap/js/bootstrap.plugin.min.js',
        textarea_counter: '3rd-lib/forms/jquery.counter.min.js',
        jquery_double_select : '3rd-lib/jquery/jquerydoubleselectmin.js',
        jquery_form : '3rd-lib/jquery/jquery.form.js'
	};

	seajs.config({
		debug: true,
        base:'/scripts/',
		charset: 'utf-8',

		alias: alias,

		vars: {
		},

		map: [
			// ['.js', '-debug.js']
		],

		// 预加载项
		preload: [
			// Function.prototype.bind ? '' : 'es5-safe',
			this.JSON ? '' : 'json'
//			'placeholder'
		]
//
//		paths: {
//			'gallery': 'gallery',
//			'src': 'src',
//			'components': 'src/components'
//		},

	});
})(seajs);