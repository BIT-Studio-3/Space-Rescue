using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Follow : MonoBehaviour
{
    [SerializeField] private Transform target; // follow target

    private float cameraHeight = 0.25f;
    private float distance = 12.0f;
    private float rotationSpeed = 3.0f;
    private float smoothTime = 0.2f;

    private Vector3 cameraPos;
    private Vector3 velocity;

    private Transform thisTransform;

    private float angle;

    private void Start() => thisTransform = gameObject.transform;

    void LateUpdate()
    {
        FollowPlayer();
    }

    private void FollowPlayer()
    {
        // Calculate position.
        cameraPos = target.position - (target.forward * distance) + target.up * distance * cameraHeight;

        thisTransform.position = Vector3.SmoothDamp(thisTransform.position, cameraPos, ref velocity, smoothTime);

        // Calculate angle for rotation smoothing.
        angle = Mathf.Abs(Quaternion.Angle(thisTransform.rotation, target.rotation));

        thisTransform.rotation = Quaternion.RotateTowards(from: thisTransform.rotation, to: target.rotation, maxDegreesDelta: (angle * rotationSpeed) * Time.deltaTime);
    }
}
