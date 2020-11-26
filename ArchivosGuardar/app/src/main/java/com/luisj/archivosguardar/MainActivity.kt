package com.luisj.archivosguardar

import android.annotation.SuppressLint
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.BitmapShader
import android.graphics.drawable.BitmapDrawable
import android.net.Uri
import android.os.Bundle
import android.os.Environment
import android.provider.MediaStore
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.FileProvider
import androidx.core.content.FileProvider.getUriForFile
import androidx.core.view.drawToBitmap
import com.google.android.material.dialog.MaterialAlertDialogBuilder
import kotlinx.android.synthetic.main.activity_main.*
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.IOException
import java.text.SimpleDateFormat
import java.util.*

class MainActivity : AppCompatActivity() {
    private val REQUEST_IMAGE_CAPTURE = 1
    private var photoName:String= ""
    lateinit var currentPhotoPath: String

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        Log.e("Create","CreateLog")
    }

    override fun onResume() {
        super.onResume()
        Log.e("Resume","ResumeLog")
        getimagen.setOnClickListener {
            val options =
                    arrayOf("Camara", "Gallery")
            val materialAlertDialogBuilder = MaterialAlertDialogBuilder(this)
            materialAlertDialogBuilder.setItems(options) { dialogInterface, i ->
                when (options[i]) {
                    "Camara" -> {
                        selectedCamera()
                    }
                    "Gallery" -> {
                        selectedGallery()
                    }
                }
            }
            materialAlertDialogBuilder.setNegativeButton("Cancel") { dialogInterface, i ->
            }
            val alertDialog = materialAlertDialogBuilder.create()
            alertDialog.show()
        }
    }
    private fun selectedCamera(){
        Intent(MediaStore.ACTION_IMAGE_CAPTURE).also { takePictureIntent ->
            // Ensure that there's a camera activity to handle the intent
            takePictureIntent.resolveActivity(packageManager)?.also {
                // Create the File where the photo should go
                val photoFile: File? = try {
                    createImageFile()
                } catch (ex: IOException) {
                    Log.e("error", "$ex")
                    null
                }
                // Continue only if the File was successfully created
                photoFile?.also {
                    val photoURI: Uri = FileProvider.getUriForFile(this, "com.luisj.archivosguardar", it)
                    photoName = photoFile.name
                    takePictureIntent.putExtra(MediaStore.EXTRA_OUTPUT, photoURI)
                    startActivityForResult(takePictureIntent, REQUEST_IMAGE_CAPTURE)

                }
            }
        }
    }
    private fun selectedGallery(){
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == REQUEST_IMAGE_CAPTURE && resultCode == RESULT_OK) {
            Log.e("currentPhotoPath", currentPhotoPath)
            imageView.isDrawingCacheEnabled =true

            imageView.setImageURI(Uri.parse(currentPhotoPath))
            imageView.buildDrawingCache()
            createOtherPicture()

        }
    }
    private fun createOtherPicture(){
        val bitmap = Bitmap.createBitmap(imageView.drawingCache)
        val bmp = ByteArrayOutputStream()
        bmp.
    }

    @SuppressLint("SimpleDateFormat")
    @Throws(IOException::class)
    private fun createImageFile(): File {
        // Create an image file name
        val timeStamp: String = SimpleDateFormat("yyyyMMdd_HHmmss").format(Date())
        val imagePath = getExternalFilesDir(Environment.DIRECTORY_PICTURES)
        return File.createTempFile("IMAGE_${timeStamp}",".png",imagePath).apply {
            currentPhotoPath = absolutePath
        }
    }

    override fun finish() {
        Log.e("finish","finishLog")
        super.finish()

    }
}