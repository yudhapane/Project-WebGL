var camera, scene, renderer, controls;
var geometry, material, box;

init();
animate();

// Sets up the scene
function init()
{
	// Get the window size
	var width	= window.innerWidth;
	var height	= window.innerHeight;

	// Create the camera object
	camera		= new THREE.PerspectiveCamera(45, width/height, 0.1, 10000);
	// Set some distance between our view and the box
	camera.position.set(0, 0, 10);

	// Create the scene object
	scene		= new THREE.Scene();

	// Create a box geometry object
	geometry	= new THREE.BoxGeometry(0.5, 0.5, 0.5);
	// Create a box material object
    material	= new THREE.MeshBasicMaterial(
    {
        color		: 0xFFAA00,
        wireframe	: true
    });
    // Create a box object based on the previous geometry and material
    box			= new THREE.Mesh(geometry, material);
    // Add box to scene
    scene.add(box);

	// Create the renderer object
	renderer	= new THREE.WebGLRenderer(
	{
		antialias	: true
	});
	// Set the renderer size to window size
	renderer.setSize(width, height);
	// Add renderer to DOM
	document.body.appendChild(renderer.domElement);	

	// Create a control object for mouse
	controls	= new THREE.OrbitControls(camera, renderer.domElement);
}

// Renders the scene and updates the render as needed
function animate()
{
	// Preserve animation frame
	requestAnimationFrame(animate);
	
	// Rotate the box to visualize WebGL in 3D
	box.rotation.x	+= 0.001;
        box.rotation.y	+= 0.02;
	//box.translation.x += 0.1;

	// Render the scene object
	renderer.render(scene, camera);
	// Update the control object
	controls.update();
}