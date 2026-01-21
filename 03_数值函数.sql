<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <title>3D 坐标轴示例</title>
  <style>
    body { margin: 0; overflow: hidden; }
    canvas { display: block; }
  </style>
</head>
<body>
  <!-- 引入 Three.js -->
  <script src="https://cdn.jsdelivr.net/npm/three@0.158.0/build/three.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/three@0.158.0/examples/js/controls/OrbitControls.js"></script>

  <script>
    // 创建场景
    const scene = new THREE.Scene();
    scene.background = new THREE.Color(0x111111);

    // 创建摄像机
    const camera = new THREE.PerspectiveCamera(75, window.innerWidth/window.innerHeight, 0.1, 1000);
    camera.position.set(3, 3, 3); // 斜上方看向原点

    // 渲染器
    const renderer = new THREE.WebGLRenderer({antialias: true});
    renderer.setSize(window.innerWidth, window.innerHeight);
    document.body.appendChild(renderer.domElement);

    // 控制器，可以旋转、缩放
    const controls = new THREE.OrbitControls(camera, renderer.domElement);
    controls.update();

    // 添加坐标轴
    const axesHelper = new THREE.AxesHelper(2); // 参数是轴长度
    scene.add(axesHelper);

    // 添加原点小球
    const sphereGeometry = new THREE.SphereGeometry(0.05, 32, 32);
    const sphereMaterial = new THREE.MeshBasicMaterial({color: 0xffffff});
    const originSphere = new THREE.Mesh(sphereGeometry, sphereMaterial);
    originSphere.position.set(0, 0, 0);
    scene.add(originSphere);

    // 自适应窗口
    window.addEventListener('resize', () => {
      camera.aspect = window.innerWidth / window.innerHeight;
      camera.updateProjectionMatrix();
      renderer.setSize(window.innerWidth, window.innerHeight);
    });

    // 渲染循环
    function animate() {
      requestAnimationFrame(animate);
      controls.update();
      renderer.render(scene, camera);
    }
    animate();
  </script>
</body>
</html>
