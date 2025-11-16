(ns
 ^{:author "YGVKN" :build-info "Build jar & uberjar & more"}
 build
  (:require [clojure.tools.build.api :as build] :reload-all))

(defonce dist "target")
(defonce jar-stuff (str dist "/classes"))
(defonce lib-name 'com.github.YGVKN/clojure)
(defonce app-name "clj-http-raw")
(defonce version "0.0.1")
(defonce main  (build/create-basis {:project "deps.edn"}))
(defonce jar-file-name (format "%s/%s-%s.jar" dist (name lib-name) version))
(defonce uber-file-name (format "%s/%s-%s-standalone.jar" dist app-name version))

(defn jar-info
  [_]
  (build/process {:command-args ["jar" "-tvf" uber-file-name]}))

(defn junk
  [_]
  (build/process {:command-args ["/bin/sh" "-c" "ls -la | lolcat -f -t"]}))

(defn purge
  [_]
  (build/process {:command-args ["/bin/sh" "-c" "rm  -rfv ./.clj-kondo ./.cpcache ./.lsp | lolcat -f -t"]}))

(defn clean [_]
  (build/delete {:path dist})
  (println (format "Build folder \"%s\" removed" dist)))

(defn jar [_]
  (clean nil)

  (build/copy-dir {:src-dirs ["src" "resources"]
                   :target-dir jar-stuff})
  (build/write-pom {:class-dir jar-stuff
                    :lib lib-name
                    :version version
                    :basis main
                    :src-dirs ["src"]})
  (build/jar {:class-dir jar-stuff
              :jar-file jar-file-name})
  (println (format "Jar file created: \"%s\"" jar-file-name)))

(defn uber [_]
  (clean nil)

  (build/copy-dir {:src-dirs ["resources"]
                   :target-dir jar-stuff})

  (build/compile-clj {:basis main
                      :src-dirs ["src"]
                      :class-dir jar-stuff
                      :javac-opts ["--release" "24.0.1"]})

  (build/uber {:class-dir jar-stuff
               :uber-file uber-file-name
               :basis main
               :main 'http.raw})
  (println (format "Uber file created: \"%s\"" uber-file-name)))
