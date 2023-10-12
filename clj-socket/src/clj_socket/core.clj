(ns clj-socket.core
  (:require [clojure.java.io :as io])
  (:import  [java.net ServerSocket])
  (:gen-class))


(defn receive
  [socket]
  (.readLine (io/reader socket)))

(defn ssend
  [socket msg]
  (let [writer (io/writer socket)]
      (.write writer msg)
      (.flush writer)))

(defn serve-persistent [port handler]
  (let [running (atom true)]
    (future
      (with-open [server-sock (ServerSocket. port)]
        (while @running
          (with-open [sock (.accept server-sock)]
            (let [msg-in (receive sock)
                  msg-out (handler msg-in)]
              (ssend sock msg-out))))))
    running))

;;(def server  (serve-persistent 8765 #(.toUpperCase %)))
;;(reset! server false) ;stop server


(defn -main [& _]
  (println "======== Socket Opened ========")
  (serve-persistent 8765 #(.toUpperCase %)))


