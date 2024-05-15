# Play Ball
![main logo](https://github.com/leedohyung28/PlayBall/assets/91038179/35ec4db4-78fc-401e-98cd-e021ed6eeece)

---

### 💡 웹 앱 설계 목적 

코로나 이후 침체된 야구 시장의 붐이 일어나길 바라면서 제작하였습니다.

---

### 🎓 Using Tools

#### Platform 🏬
<img src="https://img.shields.io/badge/VS CODE-007ACC?style=for-the-badge&logo=Visual Studio Code&logoColor=white">
<img src="https://img.shields.io/badge/FLUTTER-02569B?style=for-the-badge&logo=flutter&logoColor=white">

#### Languages 🚩
<img src="https://img.shields.io/badge/DART-0175C2?style=for-the-badge&logo=dart&logoColor=white">

---

### ⚡ 어려웠던 점

1. 메인 화면의 Youtube 영상이 자동 재생되는 것으로 만들고 싶었다.<br>
때문에 `youtube_player_flutter` package를 사용했지만, 해당 package는 모바일 앱에서만 동작된다.<br>
➡ **`youtube_player_iframe` package를 사용하여 해결하였습니다.**

2. Youtube 영상이 제일 앞에 있는 것으로 인식이 되어서 화면 중간에 버튼 3가지를 누를 수 없다.<br>
➡ **`pointer_interceptor` package를 사용하여 해당 부분을 `PointerInterceptor` widget으로 감싸주었습니다.**

3. Youtube 영상을 너비를 맞추고 세로를 자르고 싶은데 영상을 자를 수가 없었다.<br>
➡ **바로 아래 "Play Ball 특징"이 있는 Container의 높이를 크게해서 영상이 보이지 않도록 하였습니다.**

---

### 📄 기능 상세 설명
[상세 기능 포함 PDF](https://drive.google.com/file/d/1m0rv5JFSpAhHMv_MQZcAfGbQIPCth0Nn/view?usp=sharing)
