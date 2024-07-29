'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "2e30667f35e9457880d72027ac914844",
"index.html": "cd200c8390b93bad8f5c9e2fc9eadc96",
"/": "cd200c8390b93bad8f5c9e2fc9eadc96",
"main.dart.js": "fdad56bd5e76598fadafa9c5c57d6a80",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.png": "e4d742ec3826a4939b19d8161590ce4a",
"icons/favicon-16x16.png": "e4d742ec3826a4939b19d8161590ce4a",
"icons/favicon.ico": "c8d510191ec4ec1f9f9861c66721fee2",
"icons/apple-icon.png": "1c3cfcd1754ee84eb7cc3729c689c66a",
"icons/apple-icon-144x144.png": "753bceade8aaabe8bacbd198d214119b",
"icons/android-icon-192x192.png": "02c6b848878c4a610e2dbec29f23f38a",
"icons/apple-icon-precomposed.png": "1c3cfcd1754ee84eb7cc3729c689c66a",
"icons/apple-icon-114x114.png": "00d38de8c8d88d083368f6c95c958110",
"icons/ms-icon-310x310.png": "2437c1799a73a962a6054eb29bd221b5",
"icons/ms-icon-144x144.png": "753bceade8aaabe8bacbd198d214119b",
"icons/apple-icon-57x57.png": "f1e07e330f702500054f72a26a2b279f",
"icons/apple-icon-152x152.png": "a141ef17e39a5c835286c09b2c2c1671",
"icons/ms-icon-150x150.png": "29399a27b0148b5a3e7dac6c4ed6c064",
"icons/android-icon-72x72.png": "611e5df7110adfeec50b290600522995",
"icons/android-icon-96x96.png": "1696d31f55f7bb5ef71f310f25dbbad3",
"icons/android-icon-36x36.png": "dea6a35d4861cf0625a35c96e31acc22",
"icons/apple-icon-180x180.png": "246ac45f7612928ddb377bab4421430b",
"icons/favicon-96x96.png": "1696d31f55f7bb5ef71f310f25dbbad3",
"icons/android-icon-48x48.png": "b2a140c5b75ae73c34f464c3c55afc56",
"icons/apple-icon-76x76.png": "96fd4caa9d276797e4cba9aeda0f9c15",
"icons/apple-icon-60x60.png": "7595f2e8f1b0868b001e7a0d0b71b40e",
"icons/browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"icons/android-icon-144x144.png": "753bceade8aaabe8bacbd198d214119b",
"icons/apple-icon-72x72.png": "611e5df7110adfeec50b290600522995",
"icons/apple-icon-120x120.png": "7805240ae5fecaec2a11e76fd2e010cd",
"icons/favicon-32x32.png": "e376fb3db72d82648abe23ee6041b098",
"icons/ms-icon-70x70.png": "ec2d04d86f84b9e16c0d382804542088",
"manifest.json": "143a481726a1f9068574d3b1a9431478",
"assets/AssetManifest.json": "483ca16a04b61eb8d52b5b7dc80e2ecd",
"assets/NOTICES": "88c9efa9f95ca17477e2a48005f5673e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "84042e46c6598cab7bd8ac76d26fe467",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/lib/core/config/localization/uz-UZ.json": "afe95528ab5a785ca5102f504de7e6d3",
"assets/lib/core/config/localization/locale_keys.g.dart": "c70a2940474f18644367af6f13106c8f",
"assets/lib/core/config/localization/ru-RU.json": "6b4562a4a9d9d26d20f2b288a9999023",
"assets/lib/core/config/localization/en-EN.json": "bd3801f649b529c07fd50d01d910d787",
"assets/AssetManifest.bin": "fa509bc0c5f49f3bf4cead590169ac99",
"assets/fonts/MaterialIcons-Regular.otf": "d0cc169cf28192e72bfdb40ea89c11f6",
"assets/assets/images/section2.jpeg": "28da310e1b78c79b50b175427f33effb",
"assets/assets/images/section3.jpeg": "d4db2fcf01f03f0dba87a2c259082b7a",
"assets/assets/images/section1.png": "e8391556d33359015767f8094db02025",
"assets/assets/images/section2.png": "3ce412ede8ed33111b92083ae0ccaf11",
"assets/assets/images/section3.png": "2c2bb82840901cb331140403e9937c05",
"assets/assets/images/logo.png": "f49ceb17eec8b53c119f8873449493b1",
"assets/assets/images/section1.jpeg": "b47d97075b8ce753eb0bd9a7ca145377",
"assets/assets/vectors/telegram.svg": "5aebb060ed8b8a4bd3ba945bbbc2fb3f",
"assets/assets/vectors/success.svg": "4a3a166621c19b51c8d8de0e7f829621",
"assets/assets/vectors/linkedin.svg": "a5aca4c6be8a9de4f8d2cd500b5836f8",
"assets/assets/fonts/CustomIcons.ttf": "1707898d30f553672aa37eb065779831",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
