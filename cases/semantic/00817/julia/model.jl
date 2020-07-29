#= 
    This code was generated by heta-compiler of v0.5.8
    
=#

module julia 
using SimSolver

### create default constants
constants_ = NamedTuple{(
  
)}(Float64[
  
])

### initialization of ODE variables and Records
function start_(cons)
    #() = cons

    # Heta initialize
    t = 0.0 # initial time
    C = 0.95
    kf = 2.5
    S1 = 1.0
    kr = 0.2
    S2 = 0.5
    S3 = 0.0
    reaction1 = C * (kf * S1 + (-1.0) * kr * S2 * S3)
    
    # save results

    return (
        [
            S1 * C,
            S2 * C,
            S3 * C,
        ],
        
        [
            C,
            kf,
            kr,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (C,kf,kr,) = p.static
    (S1_,S2_,S3_,) = u 

    # Heta rules
    S1 = S1_ / C
    S2 = S2_ / C
    S3 = S3_ / C
    reaction1 = C * (kf * S1 + (-1.0) * kr * S2 * S3)
    
    #p.static .= [C,kf,kr,]
    du .= [
      -reaction1,  # dS1_/dt
      reaction1,  # dS2_/dt
      reaction1,  # dS3_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (C,kf,kr,) = integrator.p.static
        (S1_,S2_,S3_,) = u

        # Heta rules
        S1 = S1_ / C
        S2 = S2_ / C
        S3 = S3_ / C
        reaction1 = C * (kf * S1 + (-1.0) * kr * S2 * S3)
        
        # calculate amounts
        C_ = C
        reaction1_ = reaction1
        kf_ = kf
        kr_ = kr

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events


### continous events


### event assignments


### OUTPUT ###

x00817 = Model(
  start_,
  ode_,
  [
  ],
  make_saving_,
  constants_
)

models = (
    x00817 = x00817
)
tasks = ()

export models, tasks

end
