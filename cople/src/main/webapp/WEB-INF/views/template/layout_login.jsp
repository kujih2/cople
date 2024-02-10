<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title><tiles:getAsString name="title" /></title>
</head>
<body class="notion-body">
 
            <tiles:insertAttribute name="body"/>

</body>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/HJW/login.css">
<style>
body {
    background: #fff
}

body.dark {
    background: #191919
}

@keyframes startup-shimmer-animation {
    0% {
        transform: translateX(-100%) translateZ(0)
    }

    100% {
        transform: translateX(100%) translateZ(0)
    }
}

@keyframes startup-shimmer-fade-in {
    0% {
        opacity: 0
    }

    100% {
        opacity: 1
    }
}

@keyframes startup-spinner-rotate {
    0% {
        transform: rotate(0) translateZ(0)
    }

    100% {
        transform: rotate(360deg) translateZ(0)
    }
}

#initial-loading-spinner {
    position: fixed;
    height: 100vh;
    width: 100vw;
    z-index: -1;
    display: none;
    align-items: center;
    justify-content: center;
    opacity: .5
}

#initial-loading-spinner svg {
    height: 24px;
    width: 24px;
    animation: startup-spinner-rotate 1s linear infinite;
    transform-origin: center center;
    pointer-events: none
}

#skeleton {
    background: #fff;
    position: fixed;
    height: 100vh;
    width: 100vw;
    z-index: -1;
    display: none;
    overflow: hidden
}

#initial-loading-spinner.show,#skeleton.show {
    display: flex
}

body.dark #skeleton {
    background: #191919
}

.notion-front-page #skeleton,.notion-mobile #skeleton {
    display: none
}

#skeleton-sidebar {
    background-color: #fbfbfa;
    box-shadow: inset -1px 0 0 0 rgba(0,0,0,.025);
    display: flex;
    width: 240px;
    flex-direction: column;
    padding: 12px 14px;
    overflow: hidden
}

body.dark #skeleton-sidebar {
    background-color: #202020;
    box-shadow: inset -1px 0 0 0 rgba(255,255,255,.05)
}

#skeleton.isElectron #skeleton-sidebar {
    padding-top: 46px
}

#skeleton .row {
    display: flex;
    margin-bottom: 8px;
    align-items: center
}

#skeleton .row.fadein {
    animation: 1s ease-in 0s 1 normal both running startup-shimmer-fade-in
}

#skeleton .chevron {
    width: 12px;
    height: 12px;
    display: block;
    margin-right: 4px;
    fill: rgba(227,226,224,.5)
}

body.dark #skeleton .chevron {
    fill: #2f2f2f
}

.startup-shimmer {
    background: rgba(227,226,224,.5);
    overflow: hidden;
    position: relative
}

body.dark .startup-shimmer {
    background: #2f2f2f
}

.startup-shimmer::before {
    content: "";
    position: absolute;
    height: 100%;
    width: 100%;
    z-index: 1;
    animation: 1s linear infinite startup-shimmer-animation;
    background: linear-gradient(90deg,rgba(0,0,0,0) 0,rgba(0,0,0,.03) 50%,rgba(0,0,0,0) 100%)
}

body.dark .startup-shimmer::before {
    background: linear-gradient(90deg,transparent 0,rgba(86,86,86,.1) 50%,transparent 100%)
}

#skeleton .icon {
    width: 20px;
    height: 20px;
    border-radius: 4px
}

#skeleton .text {
    height: 10px;
    border-radius: 10px
}

#skeleton .draggable {
    -webkit-app-region: drag;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 36px;
    display: none
}

#skeleton.isElectron .draggable {
    display: block
}
</style>
</html>
