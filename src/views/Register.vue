<template>
  <div class="min-h-screen flex flex-col">
    <Navbar />
    <main class="flex-1 flex items-center justify-center py-12 px-4">
      <Card class="w-full max-w-md">
        <CardHeader class="space-y-1">
          <CardTitle class="text-2xl font-bold">Create an account</CardTitle>
          <CardDescription>
            Enter your information to create your Komodo Hub account
          </CardDescription>
        </CardHeader>
        <CardContent>
          <Alert v-if="error" variant="destructive" class="mb-4">
            <AlertDescription>{{ error }}</AlertDescription>
          </Alert>
          <form @submit.prevent="onSubmit" class="space-y-4">
            <FormField v-slot="{ componentField }" name="fullName">
              <FormItem>
                <FormLabel>Full Name</FormLabel>
                <FormControl>
                  <Input type="text" placeholder="Enter your full name" v-bind="componentField" />
                </FormControl>
                <FormMessage />
              </FormItem>
            </FormField>

            <FormField v-slot="{ componentField }" name="email">
              <FormItem>
                <FormLabel>Email</FormLabel>
                <FormControl>
                  <Input type="email" placeholder="Enter your email" v-bind="componentField" />
                </FormControl>
                <FormMessage />
              </FormItem>
            </FormField>

            <FormField v-slot="{ componentField }" name="password">
              <FormItem>
                <FormLabel>Password</FormLabel>
                <FormControl>
                  <div class="relative">
                    <Input
                      :type="showPassword ? 'text' : 'password'"
                      placeholder="Create a password"
                      v-bind="componentField"
                    />
                    <Button
                      type="button"
                      variant="ghost"
                      size="sm"
                      class="absolute right-0 top-0 h-full px-3"
                      @click="showPassword = !showPassword"
                    >
                      <EyeOff v-if="showPassword" class="h-4 w-4" />
                      <Eye v-else class="h-4 w-4" />
                    </Button>
                  </div>
                </FormControl>
                <FormMessage />
              </FormItem>
            </FormField>

            <FormField v-slot="{ componentField }" name="confirmPassword">
              <FormItem>
                <FormLabel>Confirm Password</FormLabel>
                <FormControl>
                  <div class="relative">
                    <Input
                      :type="showConfirmPassword ? 'text' : 'password'"
                      placeholder="Confirm your password"
                      v-bind="componentField"
                    />
                    <Button
                      type="button"
                      variant="ghost"
                      size="sm"
                      class="absolute right-0 top-0 h-full px-3"
                      @click="showConfirmPassword = !showConfirmPassword"
                    >
                      <EyeOff v-if="showConfirmPassword" class="h-4 w-4" />
                      <Eye v-else class="h-4 w-4" />
                    </Button>
                  </div>
                </FormControl>
                <FormMessage />
              </FormItem>
            </FormField>

            <Button type="submit" class="w-full" :disabled="isLoading">
              <span v-if="isLoading" class="flex items-center gap-2">
                <svg class="animate-spin -ml-1 mr-2 h-4 w-4 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                  <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                  <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                </svg>
                Creating account...
              </span>
              <span v-else class="flex items-center gap-2">
                <UserPlus class="h-4 w-4" />
                Create account
              </span>
            </Button>
          </form>
        </CardContent>
        <CardFooter class="flex flex-col space-y-4">
          <div class="text-sm text-center">
            Already have an account?{" "}
            <RouterLink to="/signin" class="text-primary underline underline-offset-4 hover:text-primary/90">
              Sign in
            </RouterLink>
          </div>
        </CardFooter>
      </Card>
    </main>
    <Footer />
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { Input } from '@/components/ui/input'
import { Button } from '@/components/ui/button'
import { Eye, EyeOff, UserPlus } from 'lucide-vue-next'
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from '@/components/ui/card'
import { Alert, AlertDescription } from '@/components/ui/alert'
import Navbar from '@/components/Navbar.vue'
import Footer from '@/components/Footer.vue'

const formSchema = z.object({
  fullName: z.string().min(2, {
    message: "Full name must be at least 2 characters.",
  }),
  email: z.string().email({
    message: "Please enter a valid email address.",
  }),
  password: z.string().min(8, {
    message: "Password must be at least 8 characters.",
  }),
  confirmPassword: z.string(),
}).refine((data) => data.password === data.confirmPassword, {
  message: "Passwords don't match",
  path: ["confirmPassword"],
})

const { toast } = useToast()
const router = useRouter()
const isLoading = ref(false)
const showPassword = ref(false)
const showConfirmPassword = ref(false)
const error = ref(null)

const { handleSubmit } = useForm({
  validationSchema: toTypedSchema(formSchema),
})

function saveUserToLocalStorage(user) {
  const existingUsers = JSON.parse(localStorage.getItem('registeredUsers') || '[]')
  const newUsers = [...existingUsers, user]
  localStorage.setItem('registeredUsers', JSON.stringify(newUsers))
  console.log('User registered:', user)
}

const onSubmit = handleSubmit(async (values) => {
  isLoading.value = true
  error.value = null
 
  try {
    await new Promise(resolve => setTimeout(resolve, 1000))
    console.log("Registration values:", values)
   
    saveUserToLocalStorage({
      email: values.email,
      password: values.password,
      fullName: values.fullName
    })
   
    toast({
      title: "Registration successful!",
      description: "Welcome to Komodo Hub. Please sign in to continue.",
    })
   
    router.push("/signin")
  } catch (err) {
    console.error("Registration error:", err)
    error.value = "There was an error creating your account. Please try again."
  } finally {
    isLoading.value = false
  }
})
</script>