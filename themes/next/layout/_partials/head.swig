<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
<meta name="theme-color" content="white"/>
<link rel="apple-touch-icon" href="{{ theme.appletouchicon }}">


{# #238, Disable Baidu tranformation #}
<meta http-equiv="Cache-Control" content="no-transform" />
<meta http-equiv="Cache-Control" content="no-siteapp" />


{% if theme.google_site_verification %}
  <meta name="google-site-verification" content="{{ theme.google_site_verification }}" />
{% endif %}


{% if theme.yandex_site_verification %}
  <meta name="yandex-verification" content="{{ theme.yandex_site_verification }}" />
{% endif %}


{% if theme.baidu_site_verification %}
  <meta name="baidu-site-verification" content="{{ theme.baidu_site_verification }}" />
{% endif %}


{% if theme.qihu_site_verification %}
  <meta name="360-site-verification" content="{{ theme.qihu_site_verification }}" />
{% endif %}


{% if theme.fancybox %}
  {% set fancybox_css_uri = url_for(theme.vendors._internal + '/fancybox/source/jquery.fancybox.css?v=2.1.5') %}
  {% if theme.vendors.fancybox_css %}
    {% set fancybox_css_uri = theme.vendors.fancybox_css %}
  {% endif %}
  <link href="{{ fancybox_css_uri }}" rel="stylesheet" type="text/css" />
{% endif %}

{% include "./head/external-fonts.swig" %}

{% set font_awesome_uri = url_for(theme.vendors._internal + '/font-awesome/css/font-awesome.min.css?v=4.6.2') %}
{% if theme.vendors.fontawesome %}
  {% set font_awesome_uri = theme.vendors.fontawesome %}
{% endif %}
<link href="{{ font_awesome_uri }}" rel="stylesheet" type="text/css" />

<link href="{{ url_for(theme.css) }}/main.css?v={{ theme.version }}" rel="stylesheet" type="text/css" />

{% if page.keywords %}
  <meta name="keywords" content="{{ page.keywords }}" />
{% elif page.tags and page.tags.length %}
  <meta name="keywords" content="{% for tag in page.tags %}{{ tag.name }},{% endfor %}" />
{% elif theme.keywords %}
  <meta name="keywords" content="{{ theme.keywords }}" />
{% endif %}


{% if theme.rss === '' and config.feed and config.feed.path %}
  {% set theme.rss = config.feed.path %}
{% endif %}
{% if theme.rss %}
  <link rel="alternate" href="{{ url_for(theme.rss) }}" title="{{ config.title }}" type="application/atom+xml" />
{% endif %}


{% if theme.favicon %}
  <link rel="shortcut icon" type="image/x-icon" href="{{ url_for(theme.favicon) }}?v={{ theme.version }}" />
{% endif %}


{% if theme.facebook_sdk.enable and theme.facebook_sdk.webmaster %}
  <meta property="fb:admins" content="{{ theme.facebook_sdk.fb_admin }}" />
  <meta property="fb:app_id" content="{{ theme.facebook_sdk.app_id }}" />
{% endif %}


{{
  open_graph({
    twitter_id: theme.twitter,
    google_plus: theme.google_plus,
    fb_admins: theme.fb_admins,
    fb_app_id: theme.fb_app_id
  })
}}


{# Export some HEXO Configurations to Front-End #}
<script type="text/javascript" id="hexo.configurations">
  var NexT = window.NexT || {};
  var CONFIG = {
    root: '{{ theme.root }}',
    scheme: '{{ theme.scheme }}',
    sidebar: {{ theme.sidebar | json_encode }},
    fancybox: {{ theme.fancybox }},
    motion: {{ theme.use_motion }},
    duoshuo: {
      userId: '{{ theme.duoshuo_info.user_id | default() }}',
      author: '{{ theme.duoshuo_info.admin_nickname | default(__('author'))}}'
    },
    algolia: {
      applicationID: '{{ theme.algolia.applicationID }}',
      apiKey: '{{ theme.algolia.apiKey }}',
      indexName: '{{ theme.algolia.indexName }}',
      hits: {{ theme.algolia_search.hits | json_encode }},
      labels: {{ theme.algolia_search.labels | json_encode }}
    }
  };
</script>

{# Canonical, good for google search engine (SEO) : https://support.google.com/webmasters/answer/139066 #}
{% if theme.canonical %}
  <link rel="canonical" href="{{ config.url }}/{{ page.canonical_path.replace('index.html', '') }}"/>
{% endif %}

{% include 'head/custom-head.swig' %}


{% if theme.hassecret %}
<style>
.input-label{
  vertical-align:middle;
  font-size:18px;
  height: 30px;
  line-height: 1em;
}
.input-secret{
  width:120px;
  height: 30px;
  line-height: 30px;
  font-size:18px;
  border: 1px solid #ccc;
  vertical-align:middle;
  outline:none;
  padding:0 5px;
  box-sizing:border-box;
  border-radius:5px;
  -webkit-appearance: none;
}
.submit-btn{
  display:inline-block;
  height: 30px;
  line-height:1em;
  font-size:18px;
  text-align:center;
  margin-left:10px;
  border: 1px solid #ccc;
  background-color:transparent;
  vertical-align:middle;
  border-radius:5px;
}
.hidden-box{
  display:none;
}
</style>
<script>
window.onload = function(){
  var secretBox = document.getElementById('secret-box');
  if (secretBox === null) return;
  var contentNode = document.getElementsByClassName('post-body')[0];
  var blogNodes = contentNode.children;
  var asideNavTitle = document.getElementsByClassName('sidebar-nav-toc')[0];
  var asideNavContent = document.getElementsByClassName('post-toc-content')[0];
  asideNavTitle.style.display = 'none';
  asideNavContent.style.display = 'none';
  for(var i = 0; i < blogNodes.length; i++) {
    if (blogNodes[i].getAttribute('id') !== 'secret-box') {
      blogNodes[i].style.display = 'none';
    }
  }

  var inputSecret = document.getElementById('input-secret');
  var submitBtn = document.getElementById('submit-btn');
  var blogSecret = {{ theme.secret }};

  submitBtn.onclick = activeEvent;
  inputSecret.onkeydown = function (event) {
    event = event || window.event;
    if (event.keyCode == 13) {
      activeEvent();
    }
  }
  function activeEvent () {
    if (inputSecret.value.replace(/\s+/g, '') == blogSecret) {
      for(var i = 0; i < blogNodes.length; i++) {
        blogNodes[i].style.display = 'block';
      }
      asideNavTitle.style.display = 'inline-block';
      asideNavContent.style.display = 'block';
      secretBox.style.display = 'none';
    } else{
      alert('密码错误，请重试！');
    }
  }
}
</script>
{% else %}
<script>
window.onload = function(){
  var secretBox = document.getElementById('secret-box');
  secretBox.style.display = 'none';
}
</script>
{% endif %}
